<?php 

 echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>
<div class="container">
<div class="category_image cop-<?php echo $category_parent_id ?>">
    <?php 
    switch ( $category_parent_id ) {
      case 25:
        ?>
        <img src="/image/others/By-Occassion.jpg">
        <?php
        break;
       case 33:
        ?>
        <img src="/image/others/By-Products.jpg">
        <?php
        break;
       case 34:
        ?>
        <img src="/image/others/Corporate.jpg">
        <?php
        break;
      default:
         ?>
        <img src="/image/others/By-Price.jpg">
        <?php
        break;
    }
    ?>
  </div>
  
  <?php //require( ThemeControlHelper::getLayoutPath( 'common/mass-container.tpl' )  ); ?>

  
				<?php echo $column_left; ?> 
  
   <div id="sidebar-main" class="col-md-<?php echo $SPAN[1];?>">
    <div id="content"><?php echo $content_top; ?>
      <div class="row">
        <div class="col-lg-3 col-md-3 col-xs-12 hidden-xs">
        <?php if ($categories) { ?>
	  
      <?php if(!isset($category_t)) { ?>
      <div class="refine-search">
          <p>REFINE BY</p>
          <p>Price</p>
          <ul>
            <li><a href="/index.php?route=product/category/all&amp;path=33&amp;price=1">Under RM20</a></li>
            <li><a href="/index.php?route=product/category/all&amp;path=33&amp;price=2">RM21 — RM50</a></li>
            <li><a href="/index.php?route=product/category/all&amp;path=33&amp;price=3">RM51 - RM100</a></li>
            <li><a href="/index.php?route=product/category/all&amp;path=33&amp;price=4">RM100 and Above</a></li>
          </ul>
      </div>

      <?php }else{ ?>
	   <div class="subcategories refine-search panel panel-default box white">
			  <div class="panel-body category-list clearfix box-content">  
 
					<?php $col=6; $i=0; $ncol = floor(12/$col); foreach( $categories as $category ){  $i++; ?>
            <?php if($i%$col==1) { ?>
            <ul>
              <?php } ?>
                  <li class="category-item">
      							<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      						</li>
              <?php if( $i%$col==0 || $i==count($categories) ){ ?>
            </ul>
            <?php } ?>
					<?php } ?>
	 
          
        </div>
      </div> 
      <?php } ?>
         <?php } ?>
         </div><div class="col-lg-9 col-md-9 col-xs-12 ">
   
      <?php if ($products) { ?>
      <?php require( ThemeControlHelper::getLayoutPath( 'product/product_filter.tpl' ) );   ?>
     
      <?php require( ThemeControlHelper::getLayoutPath( 'common/product_collection.tpl' ) );  ?> 
   
      <?php } else { ?>
      <div class="content"><div class="wrapper"><?php echo $text_empty; ?></div></div>
        <!--<div class="buttons">
          <div class="right"><a href="<?php echo $continue; ?>" class="button btn btn-default"><?php echo $button_continue; ?></a></div>
        </div>-->
        <?php } ?>
</div>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>