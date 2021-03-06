<?php
class ControllerExtensionPaymentCod extends Controller {
	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');

		$data['text_loading'] = $this->language->get('text_loading');

		$data['continue'] = $this->url->link('checkout/success');

		return $this->load->view('extension/payment/cod', $data);
	}

	public function confirm() {
		if ($this->session->data['payment_method']['code'] == 'cod') {
			$this->load->model('checkout/order');

			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('cod_order_status_id'));
			$json["order_id"] =  $this->session->data['order_id'];
			$json["payment_link"] = $this->url->link('maybankcc/payment');
			if (isset($this->session->data['order_id'])) {
				$this->cart->clear();
			}
			if (isset($this->session->data['shipping_products'])) {
				unset($this->session->data['shipping_products']);
			}
			if (isset($this->session->data['shipping_address'])) {
				unset($this->session->data['shipping_address']);
			}
			if (isset($this->session->data['shipping_method'])) {
				unset($this->session->data['shipping_method']);
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
	}
}
