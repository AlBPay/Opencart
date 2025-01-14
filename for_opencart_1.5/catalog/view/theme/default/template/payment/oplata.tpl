<?php if (isset($error_message)): ?>
  <div class="warning"><?php echo $error_message; ?></div>
<?php elseif (!empty($fondy_options)): ?>
  <link rel="stylesheet" href="https://payment.albpay.io/latest/checkout-vue/checkout.css">
  <div id="checkout-container"></div>
  <script>
    const initFondyWidget = () => fondy("#checkout-container", <?php echo $fondy_options; ?>);

    if (!document.getElementById('fondy_script')){
      let fondyScript = document.createElement('script');
      fondyScript.src = 'https://payment.albpay.io/latest/checkout-vue/checkout.js';
      fondyScript.id = 'fondy_script'
      fondyScript.onload = initFondyWidget;
      document.head.appendChild(fondyScript);
    }else initFondyWidget();
  </script>
<?php else: ?>
  <form action="<?php echo $oplata_args['url']; ?>" method="post">
    <input type="hidden" name="merchant_id" value="<?php echo $oplata_args['merchant_id']; ?>">
    <input type="hidden" name="order_id" value="<?php echo  $oplata_args['order_id']; ?>">
    <input type="hidden" name="order_desc" value="<?php echo  $oplata_args['order_desc']; ?>">
    <input type="hidden" name="amount" value="<?php echo $oplata_args['amount']; ?>">
    <input type="hidden" name="currency" value="<?php echo $oplata_args['currency']; ?>">
    <input type="hidden" name="response_url" value="<?php echo $oplata_args['response_url']; ?>">
    <input type="hidden" name="server_callback_url" value="<?php echo $oplata_args['server_callback_url']; ?>">
    <input type="hidden" name="sender_email" value="<?php echo $oplata_args['sender_email']; ?>">
    <input type="hidden" name="lang" value="<?php echo $oplata_args['lang']; ?>">
    <input type="hidden" name="signature" value="<?php echo $oplata_args['signature']; ?>">
    <div class="buttons">
      <div class="right">
        <input type="submit" value="<?php echo $button_confirm; ?>" class="button" />
      </div>
    </div>
  </form>
<?php endif; ?>