<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<section class="page-contents">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">

                    <div class="col-sm-8">
                        <div class="panel panel-default margin-top-lg">
                            <div class="panel-heading text-bold">
                                <i class="fa fa-shopping-cart margin-right-sm"></i> <?= lang('checkout'); ?>
                                <a href="<?= site_url('cart'); ?>" class="pull-right">
                                    <i class="fa fa-share"></i>
                                    <?= lang('back_to_cart'); ?>
                                </a>
                            </div>
                            <div class="panel-body">

                                <div>
                                <?php
                                if (!$this->loggedIn) {
                                    ?>
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#user" aria-controls="user" role="tab" data-toggle="tab"><?= lang('Sign_In'); ?></a></li>
                                        <!--<li role="presentation"><a href="#guest" aria-controls="guest" role="tab" data-toggle="tab"></a></li>-->
                                    </ul>
                                    <?php
                                }
                                ?>

                                    <div class="tab-content padding-lg">
                                        <div role="tabpanel" class="tab-pane fade in active" id="user">
                                            <?php
                                            if ($this->loggedIn) {
                                                if ($this->Settings->indian_gst) {
                                                    $istates = $this->gst->getIndianStates();
                                                }
                                                if (!empty($addresses)) {
                                                    echo shop_form_open('order', 'class="validate"');
                                                    echo '<div class="row">';
                                                    echo '<div class="col-sm-12 text-bold">' . lang('select_address') . '</div>';
                                                    $r = 1;
                                                    foreach ($addresses as $address) {
                                                        ?>
                                                        <div class="col-sm-6">
                                                            <div class="checkbox bg">
                                                                <label>
                                                                    <input type="radio" name="address" value="<?= $address->id; ?>" <?= $r == 1 ? 'checked' : ''; ?>>
                                                                    <span>
                                                                        <?= $address->line1; ?><br>
                                                                        <?= $address->line2; ?><br>
                                                                        <?= $address->city; ?>
                                                                        <?= $this->Settings->indian_gst && isset($istates[$address->state]) ? $istates[$address->state] . ' - ' . $address->state : $address->state; ?><br>
                                                                        <?= $address->postal_code; ?> <?= $address->country; ?><br>
                                                                        <?= lang('phone') . ': ' . $address->phone; ?>
                                                                    </span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <?php
                                                        $r++;
                                                    }
                                                    echo '</div>';
                                                }
                                                if (count($addresses) < 6 && !$this->Staff) {
                                                    echo '<div class="row margin-bottom-lg">';
                                                    echo '<div class="col-sm-12"><a href="#" id="add-address" class="btn btn-primary btn-sm">' . lang('add_new_address') . '</a></div>';
                                                    echo '</div>';
                                                }
                                                if ($this->Settings->indian_gst && (isset($istates))) {
                                                    ?>
                                                <script>
                                                    var istates = <?= json_encode($istates); ?>
                                                </script>
                                                <?php
                                                } else {
                                                    echo '<script>var istates = false; </script>';
                                                } ?>
                                                <hr>
                                                <h5><strong><?= lang('payment_method'); ?></strong></h5>
                                                <div class="checkbox">

                                                 <?php if ($skrill->active) {
                                                            ?>
                                                        <label style="display: inline-block; width: auto;">
                                                            <input type="radio" name="payment_method" value="skrill" id="skrill" required="required">
                                                            <span>
                                                                <i class="fa fa-credit-card-alt margin-right-md"></i> <?= lang('card') ?>
                                                            </span>
                                                        </label>
                                                        <?php
                                                        } ?>

                                                    <label style="display: inline-block; width: auto;">
                                                       <h5></h5> <br>
                                                        <input type="radio" name="payment_method" value="cod" id="cod" required="required">
                                                        <span>
                                                            <i class="fa fa-money margin-right-md"></i> <?= lang('cod') ?>  
                                                        </span>
                                                    </label>
                                                    
                                                    
                                                    <label style="display: inline-block; width: auto;">
                                                            <input type="radio" name="payment_method" value="cod" id="mpesa" required="required">
                                                            <span>
                                                                <i class="fa fa-id-card-o" aria-hidden="true"></i>
                                                    Mpesa
                                                            </span>
                                                        </label>
                                                    
                                                    
                                                </div>
                                                <hr>
                                                <div class="form-group">
                                                    <?= lang('comment_any', 'comment'); ?>
                                                    <?= form_textarea('comment', set_value('comment'), 'class="form-control" id="comment" style="height:100px;"'); ?>
                                                </div>

                                                <?php
                                                if (!empty($addresses) && !$this->Staff) {
                                                    echo form_submit('add_order', lang('submit_order'), 'class="btn btn-theme"');
                                                } elseif ($this->Staff) {
                                                    echo '<div class="alert alert-warning margin-bottom-no">' . lang('staff_not_allowed') . '</div>';
                                                } else {
                                                    echo '<div class="alert alert-warning margin-bottom-no">' . lang('please_add_address_first') . '</div>';
                                                }
                                                echo form_close();
                                            } else {
                                                ?>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="well margin-bottom-no">
                                                            <?php  include FCPATH . 'themes' . DIRECTORY_SEPARATOR . $Settings->theme . DIRECTORY_SEPARATOR . 'shop' . DIRECTORY_SEPARATOR . 'views' . DIRECTORY_SEPARATOR . 'user' . DIRECTORY_SEPARATOR . 'login_form.php'; ?>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <h4 class="title"><span><?= lang('register_new_account'); ?></span></h4>
                                                        <p>
                                                            <?= lang('register_account_info'); ?>
                                                        </p>
                                                        <a href="<?= site_url('login#register'); ?>" class="btn btn-theme"><?= lang('register'); ?></a>
                                                    </div>
                                                </div>

                                                <?php
                                            }
                                            ?>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="guest">
                                            <?= shop_form_open('order', 'class="validate" id="guest-checkout"'); ?>
                                            <input type="hidden" value="1" name="guest_checkout">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="row">
                                                     <div class="col-md-6">
                                                            <div class="form-group">
                                                                <?= lang('Full Name', 'name'); ?> *
                                                                <?= form_input('name', set_value('name'), 'class="form-control" id="name" required="required"'); ?>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <?= lang('company(optional)', 'company'); ?>
                                                                <?= form_input('company', set_value('company'), 'class="form-control" id="company"'); ?>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <?= lang('email', 'email'); ?> (optional)
                                                        <?= form_input('email', set_value('email'), 'class="form-control" id="email"'); ?>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <?= lang('phone', 'phone'); ?> *
                                                        <?= form_input('phone', set_value('phone'), 'class="form-control" id="phone" required="required"'); ?>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <h5><strong><?= lang('delivery_address'); ?></strong></h5>
                                                    <input type="hidden" value="new" name="address">
                                                    <hr>
                                                    <div class="form-group">
                                                        <?= lang('Add delivery address', 'billing_line1'); ?> *
                                                        <?= form_input('billing_line1', set_value('billing_line1'), 'class="form-control" id="billing_line1" required="required"'); ?>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <?= lang('street', 'billing_line2'); ?>
                                                        <?= form_input('billing_line2', set_value('billing_line2'), 'class="form-control" id="billing_line2"'); ?>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-md-12">
 
                                                        </div>
                                                        <div class="col-md-6">
                                                         
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    
                                                </div>
                                                <div class="col-md-6">
                                                    
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="checkbox bg pull-right" style="margin-top: 0; margin-bottom: 0;">
                                                        
                                                        </label>
                                                    </div>
                                                    
                                                    <hr>
                                                    
                                                </div>
                                                <div class="col-md-12">
                                                    
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                           
                                                        </div>
                                                        <div class="col-md-6">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                  
                                                </div>
                                                <div class="col-md-6">
                                                   
                                                </div>
                                                <div class="col-md-12">
                                                   
                                                </div>

                                                <div class="col-md-12">
                                                    <h5><strong><?= lang('payment_method'); ?></strong></h5>
                                                    <hr>
                                                    <div class="checkbox">

                                                        <?php if ($skrill->active) {
                                                            ?>
                                                        <label style="display: inline-block; width: auto;">
                                                            <input type="radio" name="payment_method" value="skrill" id="skrill" required="required">
                                                            <span>
                                                                <i class="fa fa-credit-card-alt margin-right-md"></i> <?= lang('card') ?>
                                                            </span>
                                                        </label>
                                                        <?php
                                                        } ?>


                                                        <label style="display: inline-block; width: auto;">
                                                            <input type="radio" name="payment_method" value="cod" id="cod" required="required">
                                                            <span>
                                                                <i class="fa fa-money margin-right-md"></i> <?= lang('cod') ?>
                                                            </span>
                                                        </label>
                                                        
                                                        <label style="display: inline-block; width: auto;">
                                                            <input type="radio" name="payment_method" value="cod" id="mpesa" required="required">
                                                            <span>
                                                                <i class="fa fa-id-card-o" aria-hidden="true"></i>
                                                    Mpesa Till #: 5247335
                                                            </span>
                                                        </label>
                                                        
                                                    </div>
                                                </div>

                                            </div>

                                            <?= form_submit('guest_order', lang('submit'), 'class="btn btn-lg btn-primary"'); ?>
                                            <?= form_close(); ?>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div id="sticky-con" class="margin-top-lg">
                            <div class="panel panel-default">
                                <div class="panel-heading text-bold">
                                    <i class="fa fa-shopping-cart margin-right-sm"></i> <?= lang('totals'); ?>
                                </div>
                                <div class="panel-body">
                                    <?php
                                    $total     = $this->sma->convertMoney($this->cart->total(), false, false);
                                    $shipping  = $this->sma->convertMoney($this->cart->shipping(), false, false);
                                    $order_tax = $this->sma->convertMoney($this->cart->order_tax(), false, false);
                                    ?>
                                    <table class="table table-striped table-borderless cart-totals margin-bottom-no">
                                        <tr>
                                            <td><?= lang('total'); ?></td>
                                            <td class="text-right"><?= $this->sma->convertMoney($this->cart->total() - $this->cart->total_item_tax()); ?></td>
                                        </tr>
                                      
                                        
                                       
                                        <tr>
                                            <td><?= lang('delivery cost'); ?> *</td>
                                            <td class="text-right"><?= $this->sma->formatMoney($shipping, $selected_currency->symbol); ?></td>
                                        </tr>
                                        <tr><td colspan="2"></td></tr>
                                        <tr class="active text-bold">
                                            <td><?= lang('grand_total'); ?></td>
                                            <td class="text-right"><?= $this->sma->formatMoney(($this->sma->formatDecimal($total) + $this->sma->formatDecimal($order_tax) + $this->sma->formatDecimal($shipping)), $selected_currency->symbol); ?></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
            </div>
        </div>
    </div>
</section>

<style>
        
.centered-modal.in {
display: flex !important;
}
.centered-modal .modal-dialog {
    margin: auto;
}
    
</style>

<!-- Modal Code -->
<div class="modal fade centered-modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">MPESA Verification</h4>
      </div>
      <div class="modal-body">
        <p>Till # 5247335</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script>
    $(function(){
        $("#mpesa").on('click', function(){
            if (document.getElementById("mpesa").checked == true) {
             // do something
              $('#myModal').modal('show');
           }
        });
       
    });
    
</script>

