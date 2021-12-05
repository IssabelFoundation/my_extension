$(document).ready(
    function(){
      $('#imgqrcode').hide();
      $('#btngenerate').click(function(e) {
          e.preventDefault();
          template = $('#template').val();
          asteriskip = $('#asteriskip').val();
          template = template.replace("<","&lt;");
          asteriskip = asteriskip.replace("<","&lt;");
          $.ajax({
               url : '/index.php?menu=myex_config&action=qrcode&rawmode=yes&template='+template+'&asteriskip='+asteriskip,
               type : 'GET',
           }).always(function(data) {
              console.log(data);
              $('#imgqrcode').attr('src','data:image/png;base64,'+data).show();
           });


      });

      var content = "<input type='text' class='bss-input' onKeyDown='event.stopPropagation();' onKeyPress='addSelectInpKeyPress(this,event)' onClick='event.stopPropagation()' placeholder='"+_tr('Add Hostname')+"'> <span class='glyphicon glyphicon-plus addnewicon' onClick='addSelectItem(this,event,1);'></span>";
      var divider = $('<option/>').addClass('divider').data('divider', true);
      var addoption = $('<option/>', {class: 'addItem'}).data('content', content);
      var hostoption = $('<option/>').data('content', window.location.host).val(window.location.host);
      $('.selectpicker').selectpicker();
      if($('.selectpickeradd option[value="'+window.location.host+'"]').length==0) {
          $('.selectpickeradd').append(hostoption);
      }
      $('.selectpickeradd').append(divider).append(addoption).selectpicker();


         $( "#slider" ).slider({
            range: "min",
            min: 0,
            max: 20,
            value: $("#recording_priority").val(),
            slide: function(event, ui){
                $("#recording_priority_amount").text(ui.value);
                $("#recording_priority").val(ui.value);
            }
         });
         
         $("input[name|=phone_number_CF]").focus(
            function(){
                $(this).attr("value","");
            }
         );
         $("input[name|=phone_number_CFU]").focus(
            function(){
                $(this).attr("value","");
            }
         );
         $("input[name|=phone_number_CFB]").focus(
            function(){
                $(this).attr("value","");
            }
         );

         $("input[name|=chkoldcall_forward]").click(
            function()
            {       var statusCF = $("#call_forward").val();
                    if(statusCF == "off")
                       $("input[name|=phone_number_CF]").attr("disabled","disabled");
                    else
                        $("input[name|=phone_number_CF]").removeAttr("disabled");
            }
        );
        $("input[name|=chkoldcall_forward_U]").click(
            function()
            {       var statusCFU = $("#call_forward_U").val();
                    if(statusCFU == "off")
                        $("input[name|=phone_number_CFU]").attr("disabled","disabled");
                    else
                        $("input[name|=phone_number_CFU]").removeAttr("disabled");
            }
        );
        $("input[name|=chkoldcall_forward_B]").click(
            function()
            {       var statusCFB = $("#call_forward_B").val();
                    if(statusCFB == "off")
                        $("input[name|=phone_number_CFB]").attr("disabled","disabled");
                    else
                        $("input[name|=phone_number_CFB]").removeAttr("disabled");
            }
        );
         
         if($("#call_forward").val() == "off")
            $("input[name|=phone_number_CF]").attr("disabled","disabled");
         else
            $("input[name|=phone_number_CF]").removeAttr("disabled");

         if($("#call_forward_U").val() == "off")
            $("input[name|=phone_number_CFU]").attr("disabled","disabled");
         else
            $("input[name|=phone_number_CFU]").removeAttr("disabled");

         if($("#call_forward_B").val() == "off")
            $("input[name|=phone_number_CFB]").attr("disabled","disabled");
         else
            $("input[name|=phone_number_CFB]").removeAttr("disabled");
    }
);


function _tr(texto) {
   if(typeof(lang[texto])=='undefined') {
       return texto;
   } else {
       return lang[texto];
   }
}
