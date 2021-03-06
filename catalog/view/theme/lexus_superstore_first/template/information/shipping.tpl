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
  <div class="row">
				<?php echo $column_left; ?>
  
   <section id="sidebar-main" class="col-md-<?php echo $block[0];?>"><div id="content"><?php echo $content_top; ?>
      <h2 class="faq_header"><?php echo $heading_title; ?></h2>
      <div class="bline"></div>
      <ul class="shipping_detail">

        <li>We shall deliver the products to the delivery address specified and keyed in by you on the delivery method. Your order will be delivered to you via the service of a courier service company appointed by the Company.</li>
<li>All products will only delivered after full payment being made and confirmed by the Company.</li>
<li>As all daily deliveries are scheduled to multiple locations, specific time delivery requested might vary from time to time.</li>
<li>During festive seasons whereby delivery commitments are at its peak, you will be advised the next best delivery time. In the event if the recipient is not at home, has returned to his or her hometown, changed address or gone overseas, the product will be delivered after the festive season.</li>
<li> Late delivery due to no recipient at the point of delivery or incorrect address will not be entertained.</li>
<li> Delivery schedule does not apply to Sunday gazetted Public Holidays.</li>
<li> Delivery Charges will be calculated based on delivery postcode.</li>
<li>  Any re-direct zone or re-send product will be charged with a minimum fee of RM 20.00.</li>
<li> Free delivery service per address for hamper worth RM299 and above is applicable within Free Delivery Zone. Delivery outside Free Delivery Zone, please refer to the delivery charges guideline. Destinations not stated, please contact our customer service.</li>

      </ul>
    </div>
     <h3 class="faq_header">Delivery Zones</h3>
      <div class="cline"></div>
       <?php echo $delivery_zone ?>
      <?php echo $content_bottom; ?></div>
   </section>	
		<?php echo $column_right; ?></div>
</div>
<style type="text/css">#header-bottom{display: none;}#header-main{padding-bottom: 0px;border-bottom: solid 1px #e3e3e3;}</style>
<?php echo $footer; ?>
