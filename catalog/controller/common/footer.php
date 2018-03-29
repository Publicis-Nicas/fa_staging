<?php
class ControllerCommonFooter extends Controller {
    public function index() {

        // Pavo 2.2 fix
        require_once( DIR_SYSTEM . 'pavothemes/loader.php' );

        $this->load->language('extension/module/themecontrol');
        $data['objlang'] = $this->language;

        $config = $this->registry->get('config');
        $data['sconfig'] = $config;

        $helper = ThemeControlHelper::getInstance( $this->registry, $config->get('theme_default_directory') );
        $helper->triggerUserParams( array('header_layout','productlayout') );
        $data['helper'] = $helper;

        $themeConfig = (array)$config->get('themecontrol');
        // Pavo 2.2 end fix

        $this->load->language('common/footer');

        $data['scripts'] = $this->document->getScripts('footer');

        $data['text_information'] = $this->language->get('text_information');
        $data['text_service'] = $this->language->get('text_service');
        $data['text_extra'] = $this->language->get('text_extra');
        
        $data['text_return'] = $this->language->get('text_return');
        $data['text_sitemap'] = $this->language->get('text_sitemap');
        $data['text_manufacturer'] = $this->language->get('text_manufacturer');
        $data['text_voucher'] = $this->language->get('text_voucher');
        $data['text_affiliate'] = $this->language->get('text_affiliate');
        $data['text_special'] = $this->language->get('text_special');
        $data['text_account'] = $this->language->get('text_account');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_wishlist'] = $this->language->get('text_wishlist');
        $data['text_newsletter'] = $this->language->get('text_newsletter');

        $data['text_contact'] = $this->language->get('text_contact');
        $data['text_shipping'] = $this->language->get('text_shipping');
        $data['text_faq'] = $this->language->get('text_faq');
        $data['text_aboutus'] = $this->language->get('text_aboutus');
        $data['text_storelocator'] = $this->language->get('text_storelocator');
        $data['text_career'] = $this->language->get('text_career');
        
        $data['text_connectwithus'] = $this->language->get('text_connectwithus');
        $data['text_facebook'] = $this->language->get('text_facebook');
        $data['text_instagram'] = $this->language->get('text_instagram');

        $data['aboutus'] = $this->url->link('information/aboutus');
        $data['contact'] = $this->url->link('information/contact');
        $data['faq'] = $this->url->link('information/faq');
        $data['shipping'] = $this->url->link('information/shipping');
        $data['storelocator'] = $this->url->link('information/storelocator');
        $data['career'] = $this->url->link('information/career');
        $data['facebooklink'] = "http://www.facebook.com/";
        $data['instagramlink'] = "http://www.instagram.com/";
        $data['contact'] = $this->url->link('information/contact');
        $data['return'] = $this->url->link('account/return/add', '', true);
        $data['sitemap'] = $this->url->link('information/sitemap');
        $data['manufacturer'] = $this->url->link('product/manufacturer');
        $data['voucher'] = $this->url->link('account/voucher', '', true);
        $data['affiliate'] = $this->url->link('affiliate/account', '', true);
        $data['special'] = $this->url->link('product/special');
        $data['account'] = $this->url->link('account/account', '', true);
        $data['order'] = $this->url->link('account/order', '', true);
        $data['wishlist'] = $this->url->link('account/wishlist', '', true);
        $data['newsletter'] = $this->url->link('account/newsletter', '', true);

        $data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

        // Whos Online
        if ($this->config->get('config_customer_online')) {
            $this->load->model('tool/online');

            if (isset($this->request->server['REMOTE_ADDR'])) {
                $ip = $this->request->server['REMOTE_ADDR'];
            } else {
                $ip = '';
            }

            if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
                $url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
            } else {
                $url = '';
            }

            if (isset($this->request->server['HTTP_REFERER'])) {
                $referer = $this->request->server['HTTP_REFERER'];
            } else {
                $referer = '';
            }

            $this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
        }

        return $this->load->view('common/footer', $data);
    }
}