
;;
;;(deffacts products 
;;	(product (name USBMem) (category storage) (part-number 1234) (price 199.99))
;;	(product (name Amplifier) (category electronics) (part-number 2341) (price 399.99))
;;	(product (name "Rubber duck") (category mechanics) (part-number 3412) (price 99.99))
;;)
;;
;;(deffacts customers
;;	(customer (customer-id 101) (name joe) (address bla bla bla) (phone 3313073905))
;;	(customer (customer-id 102) (name mary) (address bla bla bla) (phone 333222345))
;;	(customer (customer-id 103) (name bob) (address bla bla bla) (phone 331567890)) 
;;)  	 
;;
;;
;;(deffacts orders 
;;	(order (order-number 300) (customer-id 102))
;;	(order (order-number 301) (customer-id 103))
;;)
;;
;;(deffacts items-list
;;	(line-item (order-number 300) (customer-id 102) (part-number 1234))
;;	(line-item (order-number 301) (customer-id 103) (part-number 2341) (quantity 10))
;;)
;;

;;-----------------------HANDS ON 3 --------------------

(deffacts clientes
	(cliente (cliente-id 1)(nombre Miguel)(edad 21)(celular 3313301578)(sexo M)(direccion margaritas 118))
	(cliente (cliente-id 2)(nombre Angel)(edad 18)(celular 3344135765)(sexo M)(direccion cristobal 21))
	(cliente (cliente-id 3)(nombre Joe)(edad 27)(celular 3357890790)(sexo M)(direccion venus 43))
	(cliente (cliente-id 4)(nombre Amanda)(edad 25)(celular 3312457223)(sexo F)(direccion clavel 66))
	(cliente (cliente-id 5)(nombre Somin)(edad 23)(celular 3354771213)(sexo F)(direccion orquidea 6))
	(cliente (cliente-id 6)(nombre cesar)(edad 27)(celular 3366263809)(sexo M)(direccion veronica 79))
)

(deffacts smartphones
	(smartphone (smartphone-id 1) (marca xiaomi)(modelo "Redmi Note 10s")(precio 3800)(almacenamiento 128gb)(bateria 5000mAh)(peso 178g)(color dorado))
	(smartphone (smartphone-id 2) (marca xiaomi)(modelo "Redmi Note 11s")(precio 4500)(almacenamiento 128gb)(bateria 5000mAh)(peso 179g)(color blanco))
	(smartphone (smartphone-id 3) (marca xiaomi)(modelo "Redmi Note 10 pro")(precio 5500)(almacenamiento 128gb)(bateria 5020mAh)(peso 194g)(color gris))
	(smartphone (smartphone-id 4) (marca xiaomi)(modelo "Redmi Note 11 pro")(precio 6800)(almacenamiento 128gb)(bateria 5000mAh)(peso 202g)(color negro))
	(smartphone (smartphone-id 5) (marca xiaomi)(modelo "13t ultra pro")(precio 23000)(almacenamiento 1tb)(bateria 5000mAh)(peso 227g)(color perla))
	(smartphone (smartphone-id 6) (marca honor)(modelo "honor 70 ")(precio 16900)(almacenamiento 256gb)(bateria 5000mAh)(peso 179g)(color plateado))
	(smartphone (smartphone-id 7) (marca samsug)(modelo "galaxy s23 ultra ")(precio 18999)(almacenamiento 512gb)(bateria 5000mAh)(peso 234g)(color negro))

)

(deffacts computadoras
	(computador (computador-id 1) (marca apple)(modelo macbook)(precio 16999)(so mac)(almacenamiento 256gb)(bateria 7h)(peso 2kg)(color dorado))
	(computador (computador-id 2) (marca hp)(modelo "laptop notebook")(precio 6764)(so "windows 10")(almacenamiento 256gb)(bateria 4h)(peso 3.5kg)(color negro))
	(computador (computador-id 3) (marca hp)(modelo "laptopgamer")(precio 12999)(so "windows 10")(almacenamiento 512gb)(bateria 10h)(peso 2.5kg)(color plateado))
	(computador (computador-id 4) (marca asus)(modelo "laptop vivobook")(precio 5999)(so "windows 10" )(almacenamiento 512gb)(bateria 5h)(peso 1.8kg)(color gris))
)

(deffacts accesorios
	(accesorio (accesorio-id 1) (marca xiaomi)(modelo "Audífonos Redmi Buds 4 ")(precio 299)(color negro))
	(accesorio (accesorio-id 2) (marca razer)(modelo "teclado ornata v3 x")(precio 560)(color negro))
	(accesorio (accesorio-id 3) (marca adata)(modelo "disco ssd")(precio 680)(color negro))
	(accesorio (accesorio-id 4) (marca logitech)(modelo "logitech G203")(precio 380)(color rgb))
	(accesorio (accesorio-id 5) (marca kingston)(modelo "sd 128gb")(precio 250)(color negro))
	
)

(deffacts tarjetas
	(tarjeta-credito (banco bbva)(grupo visaBlue)(fecha-expiracion 13-01-2024)(numero-tarjeta 3141253947103824)(cliente-id 1))
	(tarjeta-credito (banco bbva)(grupo visaRed)(fecha-expiracion 22-11-2026)(numero-tarjeta 4156872459375849)(cliente-id 3))
	(tarjeta-credito (banco bbva)(grupo mastercard)(fecha-expiracion 22-11-2026)(numero-tarjeta 4156872459375849)(cliente-id 4))
)


(deffacts ordenes
	(orden-compra (orden-compra-id 1)(fecha 10-01-2022)(cliente-id 3))
	(orden-compra (orden-compra-id 2)(fecha 10-01-2022)(cliente-id 1))
	(orden-compra (orden-compra-id 3)(fecha 12-01-2022)(cliente-id 2))
	(orden-compra (orden-compra-id 4)(fecha 21-01-2022)(cliente-id 4))
	(orden-compra (orden-compra-id 5)(fecha 21-01-2022)(cliente-id 4))
)

(deffacts vales
	(vale-compra (vale-id 1)(vale "25% de descuento"))
	(vale-compra (vale-id 2)(vale "5% de descuento"))
	(vale-compra (vale-id 3)(vale "15% de descuento"))
	(vale-compra (vale-id 4)(vale "30% de descuento"))
	(vale-compra (vale-id 5)(vale "10% de descuento"))
	(vale-compra (vale-id 6)(vale "12 meses sin intereses en smartphones"))
	(vale-compra (vale-id 7)(vale "24 meses sin intereses en computadores"))
)


(deffacts line-itmes-s
	(line-item-s (orden-compra-id 5)(smartphone-id 3)(cliente-id 4)(cantidad 2))
	(line-item-s (orden-compra-id 2)(smartphone-id 2)(cliente-id 1)(cantidad 2))
)
(deffacts line-itmes-c
	(line-item-c (orden-compra-id 4)(computador-id 3)(cliente-id 4)(cantidad 1))
	(line-item-c (orden-compra-id 1)(computador-id 2)(cliente-id 3)(cantidad 2))
)
(deffacts line-itmes-aa
	(line-item-aa (orden-compra-id 3)(accesorio-id 1)(cliente-id 2)(cantidad 1))
)