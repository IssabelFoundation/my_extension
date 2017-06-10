%define modname my_extension

Summary: Issabel My Extension 
Name:    issabel-%{modname}
Version: 4.0.0
Release: 1
License: GPL
Group:   Applications/System
Source0: %{modname}_%{version}-%{release}.tgz
#Source0: %{modname}_%{version}-4.tgz
BuildRoot: %{_tmppath}/%{name}-%{version}-root
BuildArch: noarch
Requires(pre): issabel-framework >= 2.2.0-18
Requires: yum
Requires: issabelPBX >= 2.11.0-1

Obsoletes: elastix-my_extension
Provides: elastix-my_extension

%description
Issabel My Extension

%prep
%setup -n %{name}_%{version}-%{release}

%install
rm -rf $RPM_BUILD_ROOT

# Files provided by all Elastix modules
mkdir -p    $RPM_BUILD_ROOT/var/www/html/
mv modules/ $RPM_BUILD_ROOT/var/www/html/

# The following folder should contain all the data that is required by the installer,
# that cannot be handled by RPM.
mkdir -p    $RPM_BUILD_ROOT/usr/share/issabel/module_installer/%{name}-%{version}-%{release}/
mv setup/   $RPM_BUILD_ROOT/usr/share/issabel/module_installer/%{name}-%{version}-%{release}/
mv menu.xml $RPM_BUILD_ROOT/usr/share/issabel/module_installer/%{name}-%{version}-%{release}/

%post

# Run installer script to fix up ACLs and add module to Elastix menus.
issabel-menumerge /usr/share/issabel/module_installer/%{name}-%{version}-%{release}/menu.xml

# The installer script expects to be in /tmp/new_module
mkdir -p /tmp/new_module/%{modname}
cp -r /usr/share/issabel/module_installer/%{name}-%{version}-%{release}/* /tmp/new_module/%{modname}/
chown -R asterisk.asterisk /tmp/new_module/%{modname}

php /tmp/new_module/%{modname}/setup/installer.php

#verificando si existe el menu en pbx
path="/var/www/db/acl.db"
path2="/var/www/db/menu.db"
men=`sqlite3 $path2 "select id from menu where id='myextension'"`
if [ $men ]; then
     echo "removing menu myextension"
     issabel-menuremove "myextension"
fi
res=`sqlite3 $path "select id from acl_resource  where name='myex_config'"`
res2=`sqlite3 $path "select id from acl_group"`
#asignando los permisos a los grupos de usuarios para el modulo my_extension
for group in $res2
do
  if [ $group != 1 ]; then
     #exist registers in acl.db
     val=`sqlite3 $path "select * from acl_group_permission where id_group=$group and id_resource=$res"`
     if [ -z $val ]; then
          echo "updating group with id=$group for default My extension module"
          `sqlite3 $path "insert into acl_group_permission(id_action, id_group, id_resource) values(1,$group,$res)"`
     fi
  fi
done

rm -rf /tmp/new_module

%clean
rm -rf $RPM_BUILD_ROOT

%preun
if [ $1 -eq 0 ] ; then # Validation for desinstall this rpm
  echo "Delete My Extension menus"
  issabel-menuremove "%{modname}"
fi

%files
%defattr(-, root, root)
%{_localstatedir}/www/html/*
/usr/share/issabel/module_installer/*

%changelog
