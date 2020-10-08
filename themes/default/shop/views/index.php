<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?php if (!empty($slider)) {
    ?>
    <style>
        
      @font-face {
  font-family: Moderne Sans;
  src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/moderne_sans.woff2)
}
* {
  box-sizing: border-box;
}

video { 
    position: absolute;
    
    width: 100%;
   
    object-fit: cover;
    object-position: center;
}
div#fashion {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

h1 {
  font-family: Moderne Sans, sans-serif;
  text-align: center;
  font-size: 2rem;
  width: 100%;
  letter-spacing: .5rem;
}

h2 { 
  font-family: Century Schoolbook, Century Schoolbook L, Georgia, serif;
  
  text-align: center;
  margin: 2rem 3rem 0;
  mix-blend-mode: color-dodge;
  color: #fff;
  font-weight: 100;
}

.btn-darkred {
    background-color: darkred !important;
    border-radius: 5px;
    color: black !important; 
}

.page-contents {
    background-color: black;
}

@media screen and (max-width: 768px) {
  .page-contents {
     margin-top: -475px !important;
  }
}
    .page-contents {
        margin-top:120px;
    } 
    </style>
    
<video poster="<?= base_url("assets/images/cover.PNG"); ?>" playsinline autoplay muted loop>
<source src="video.mp4" type="video/mp4">
</video>

<div id="fashion">
  <h2 style="margin-bottom: 250px; font-style: italic; ">Ultraswift Liquor in South B, Nairobi<br> <br>
    <a class="btn btn-danger btn-darkred" href="<?= base_url("/shop/products") ?>" style="color: white; font-size: 25px"> Shop Now</a>
  </h2>
</div>
<!--    <header>-->
<!--  <div class="overlay"></div>-->
<!--  <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop" preload>-->
<!--    <source src="video.mp4" type="video/mp4">-->
<!--  </video>-->
<!--</header>-->
    
    
    
<!--<section class="slider-container">-->
<!--    <div class="container-fluid">-->
    
<!--            <video  height="440" width="100%"-->
<!--                    src="video.mp4" autoplay loop>-->
<!--            </video>-->
       
<!--    </div>-->
<!--</section>-->
<?php
} ?>

<section class="page-contents" >
    <div class="container">
        <div class="row">
            <div class="col-xs-12">

                <div class="row">
                    <div class="col-xs-9">
                        <h2 class="margin-top-no text-size-lg text-white">
                            <?= lang('featured_products'); ?>
                        </h2>
                    </div>
                    <?php
                    if (count($featured_products) > 24) {
                        ?>
                        <div class="col-xs-3">
                            <div class="controls pull-right hidden-xs">
                                <a class="left fa fa-chevron-left btn btn-xs btn-default" href="#carousel-example"
                                data-slide="prev"></a>
                                <a class="right fa fa-chevron-right btn btn-xs btn-default" href="#carousel-example"
                                data-slide="next"></a>
                            </div>
                        </div>
                        <?php
                    }
                    ?>
                </div>

                <div id="carousel-example" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <?php
                        $r = 0;
                        foreach (array_chunk($featured_products, 24) as $fps) {
                            ?>
                            <div class="item row <?= empty($r) ? 'active' : ''; ?>">
                                <div class="featured-products">
                                    <?php
                                    foreach ($fps as $fp) {
                                        ?>
                                        <div class="col-sm-6 col-md-3">
                                            <div class="product" style="z-index: 1;">
                                                <div class="details" style="transition: all 100ms ease-out 0s;">
                                                    <?php
                                                    if ($fp->promotion) {
                                                        ?>
                                                        <span class="badge badge-right theme"><?= lang('promo'); ?></span>
                                                        <?php
                                                    } ?>
                                                    <img src="<?= base_url('assets/uploads/' . $fp->image); ?>" alt="">
                                                    
                                                    <div class="stats-container">
                                                        <?php if (!$shop_settings->hide_price) {
                                                        ?>
                                                        <span class="product_price">
                                                            <?php
                                                            if ($fp->promotion) {
                                                                echo '<del class="text-red">' . $this->sma->convertMoney(isset($fp->special_price) && !empty(isset($fp->special_price)) ? $fp->special_price : $fp->price) . '</del><br>';
                                                                echo $this->sma->convertMoney($fp->promo_price);
                                                            } else {
                                                                echo $this->sma->convertMoney(isset($fp->special_price) && !empty(isset($fp->special_price)) ? $fp->special_price : $fp->price);
                                                            } ?>
                                                        </span>
                                                        <?php
                                                    } ?>
                                                        <span class="product_name">
                                                            <a href="<?= site_url('product/' . $fp->slug); ?>"><?= $fp->name; ?></a>
                                                        </span>
                                                        <a href="<?= site_url('category/' . $fp->category_slug); ?>" class="link"><?= $fp->category_name; ?></a>
                                                        <?php
                                                        if ($fp->brand_name) {
                                                            ?>
                                                            <span class="link">-</span>
                                                            <a href="<?= site_url('brand/' . $fp->brand_slug); ?>" class="link"><?= $fp->brand_name; ?></a>
                                                            <?php
                                                        } ?>
                                                        <div class="text-center">
                                                            <button data-id="<?php echo $fp->id; ?>" class="cart-btn add-to-cart"  data-toggle="modal" data-target="#myModal">Add to cart</button>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                            </div>
                                        </div>
                                        <?php
                                    } ?>
                                </div>
                            </div>
                            <?php
                            $r++;
                        }
                        ?>
                        
                        <style>
                            .modal {
  text-align: center;
}

@media screen and (min-width: 768px) { 
  .modal:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
                            
                        </style>
                    </div>
                    
                    <div class="modal fade" tabindex="-1" role="dialog"  id="myModal"  aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                    
                                 <div class="modal-body">
                                    <div class="text-center">
                                        <a href="<?= base_url("cart") ?>" class="btn btn-primary ml-5">Check Out</a>
                                        
                                         <a href="<?= base_url("shop/products") ?>" class="btn btn-success mr-5 text-white" >Continue Shopping</a> 
                                    </div> 
                                  
                             </div>
                        </div><!-- /.modal-content -->
                 </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->



                    
<!-- GetButton.io widget -->
<script type="text/javascript">
    (function () {
        var options = {
            whatsapp: "+254759531403", // WhatsApp number
            call_to_action: "Message us", // Call to action
            position: "right", // Position may be 'right' or 'left'
        };
        var proto = document.location.protocol, host = "getbutton.io", url = proto + "//static." + host;
        var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = url + '/widget-send-button/js/init.js';
        s.onload = function () { WhWidgetSendButton.init(host, proto, options); };
        var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
    })();
</script>
<!-- GetButton.io widget -->
                </div>
            </div>
        </div>
    </div>
</section>
