<?php
    $config = $sconfig;
    $theme  = $themename;
    $themeConfig = (array)$config->get('themecontrol');
?>
<?php  echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

<?php  $config = $sconfig;   

        $themeConfig = (array)$config->get('themecontrol') ?>

<div class="container">
    
  <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>
  <div class="row checkoutpage">
        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 ">
<style type="text/css">
.theForm{text-align: center;padding: 130px 0;}
.theForm p{font-size: 15px;line-height: 22px;}
      .loader {
    border: 16px solid #f3f3f3; /* Light grey */
    border-top: 16px solid #3498db; /* Blue */
    border-radius: 50%;
    width: 40px;
    height: 40px;display: block;margin: 30px auto;
    animation: spin 2s linear infinite;
}
.theButton{display: block;background:#ff8d00;font-size: 14px;line-height: 14px;padding: 15px;width: 100%;color:  #fff;font-weight:  bold;margin-bottom: 40px;width:200px;margin:0 auto;}
@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
<ul class="step_title row">
        <li><p class="step1 active">Customer Info</p></li>
        <li><p class="step2 active">Delivery Method</p></li>
        <li><p class="step3 active">Secured Payment</p></li>
        </ul>
<form name="theForm" class="theForm" action="https://ebpgcards.maybank.com/BPG/admin/payment/PaymentWindowSimulator.jsp" method="post" target="_blank">
                        <input name="MERCHANT_ACC_NO" type="hidden" value="02700701128175000698" size="50">
                        <input name="MERCHANT_TRANID" type="hidden" value="<?php echo $invoicecode; ?>" size="50">
                        
                     
                        <input name="AMOUNT" type="hidden" value="<?php echo $totalamount; ?>" size="50">
                        <input name="TRANSACTION_TYPE" type="hidden" value="3" size="50">
                        <input name="MERCHANT_TRANID" type="hidden" value="" size="50">
                        <input name="RESPONSE_TYPE" type="hidden" value="HTTP" size="50">
                        <input name="TXN_URL" type="hidden" value="" size="50">
                        <input name="RETURN_URL" type="hidden" value="<?php  echo $return_link; ?>" size="50">
                        <input name="TXN_DESC" type="hidden" value="Order from FA" size="50">
                        <input name="TXN_SIGNATURE" type="hidden" value="<?php echo $signature; ?>">
                        <p>Please do not close the browser<br/>while payment is processing</p>
                        <div class="loader"></div>
                        <input class="theButton" type="submit" value="Submit"/>
                    </form>
                    </div>


                    <div class="col-lg-1 col-md-1 col-sm-12 col-xs-12 ">&nbsp;</div>
       <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 " >
        <div id="cart_ordersummary" data-margin-top="20">
            <?php echo $order_summary; ?>
                </div>
            </div>
              </div>
          </div>
<script type="text/javascript">
      $(document).ready(function(){
        getordersummary();
            $(".theForm").submit();
            setInterval(function(){

                $.ajax({
                    type: 'get',
                    url: 'index.php?route=maybankcc/payment/checkpayment',
                    data : {"order_id":<?php echo $order_id; ?>},
                    dataType: 'json',
                    cache: false,
                    beforeSend: function() {
                        $('#button-confirm').button('loading');
                    },
                    complete: function() {
                        $('#button-confirm').button('reset');
                    },
                    success: function(json) {
                        console.log(json);
                        if(json["finishpayment"]){
                            location = json["order_link"]+"&order_id="+json["order_id"];
                        }
                    }
                });
            },1000)
      })
      function getordersummary(){
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/getordersummarybyorderid',
        type: 'post',
        dataType: 'html',
        data:{"order_id":<?php echo $order_id; ?>},
        success: function(html) {
            $("#cart_ordersummary").html(html);
        }
    });
}
</script>
<?php echo $footer; ?>