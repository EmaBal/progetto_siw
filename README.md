# OGCommerce

Credenziali:
  - admin:
    - username: admin@admin.com
    - pw: admin
  - customer con indirizzo:
    - username: customer@customer.com
    - pw: customer
  - customer senza indirizzo:
    - username: secondoCustomer@customer.com
    - pw: customer

(Le credenziali sono criptate in MD5, non è possibile quindi visualizzarle dal database)

Per consentire la registrazione come amministratore a qualsiasi visitatore è possibile eliminare il commento dalla riga 326
a 329 in signUp.jsp
