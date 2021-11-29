<div class='container-fluid'>
<div class='row'>
<div class='col-md-4'>
<legend>{$EXTENSION}</legend>
</div>
<div class='col-md-7'>
        {if $mode eq 'input'}
        <td align="left">
            <input class="button" type="submit" name="save_new" value="{$SAVE}">&nbsp;&nbsp;
            <input class="button" type="submit" name="cancel" value="{$CANCEL}">
        </td>
        {/if}
</div>
</div>
</div>
 
  <!-- Nav tabs -->
  <ul class="nav nav-tabs mymargin" role="tablist">
    <li role="presentation" class="active"><a href="#general" aria-controls="general" role="tab" data-toggle="tab">{$GENERAL}</a></li>
    <li role="presentation"><a href="#forward" aria-controls="forward" role="tab" data-toggle="tab">{$FORWARD}</a></li>
    <li role="presentation"><a href="#recording" aria-controls="recording" role="tab" data-toggle="tab">{$RECORDING}</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content bordered">
    <div role="tabpanel" class="tab-pane active" id="general">
        <div class='container-fluid'>
        <div class='row'>
          <div class='col-md-4'><b>{$do_not_disturb.LABEL}:</b></div>
          <div class='col-md-7'>{$do_not_disturb.INPUT}</div>
        </div>

        <div class='row'>
          <div class='col-md-4'><b>{$call_waiting.LABEL}:</b></div>
          <div class='col-md-7'>{$call_waiting.INPUT}</div>
        </div>
        </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="forward">
        <div class='container-fluid'>
            <div class='row'>
                <div class='col-md-4'><b>{$call_forward.LABEL}:</b></div>
                <div class='col-md-7'>{$call_forward.INPUT} {$phone_number_CF.INPUT}</div>
            </div>
            <div class='row'>
                <div class='col-md-4'><b>{$call_forward_U.LABEL}:</b></div>
                <div class='col-md-7'>{$call_forward_U.INPUT} {$phone_number_CFU.INPUT}</div>
            </div>
            <div class='row'>
                <div class='col-md-4'><b>{$call_forward_B.LABEL}:</b></div>
                <div class='col-md-7'>{$call_forward_B.INPUT} {$phone_number_CFB.INPUT}</div>
            </div>
        </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="recording">
        <div class='container-fluid'>
    <div class='row'>
        <div class='col-md-4'><b>{$recording_in_external.LABEL}:</b></div>
        <div class='col-md-7'>{$recording_in_external.INPUT}</div>
    </div>
    <div class='row'>
        <div class='col-md-4'><b>{$recording_out_external.LABEL}:</b></div>
        <div class='col-md-7'>{$recording_out_external.INPUT}</div>
    </div>
    <div class='row'>
        <div class='col-md-4'><b>{$recording_in_internal.LABEL}:</b></div>
        <div class='col-md-7'>{$recording_in_internal.INPUT}</div>
    </div>
    <div class='row'>
        <div class='col-md-4'><b>{$recording_out_internal.LABEL}:</b></div>
        <div class='col-md-7'>{$recording_out_internal.INPUT}</div>
    </div>
    <div class='row'>
        <div class='col-md-4'><b>{$recording_ondemand.LABEL}:</b></div>
        <div class='col-md-7'>{$recording_ondemand.INPUT}</div>
    </div>
    <div class='row'>
        <div class='col-md-4'><b>{$recording_priority.LABEL}:</b></div>
        <div class='col-md-7'>
            <div style="width:270px">
                <span id="recording_priority_amount" name="recording_priority_amount" style="border:0; color:#f6931f; font-weight:bold; float: right">{$recording_priority_value}</span>
                <div id="slider" style="width:240px;"></div>
                {$recording_priority.INPUT}
            </div>    
        </div>
    </div>
 
        </div>
    </div>
  </div>

</div>

