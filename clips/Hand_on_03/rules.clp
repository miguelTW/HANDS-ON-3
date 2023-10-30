
;;;;Define a rule for finding those customers who have not bought nothing at all... so far
;;
;;(defrule cust-not-buying
;;      (customer (customer-id ?id) (name ?name))
;;      (not (order (order-number ?order) (customer-id ?id)))
;;   =>
;;   (printout t ?name " no ha comprado... nada!" crlf))
;;
;;
;;;;Define a rule for finding which products have been bought
;;
;;(defrule prods-bought
;;   (order (order-number ?order))
;;   (line-item (order-number ?order) (part-number ?part))
;;   (product (part-number ?part) (name ?pn))
;;   =>
;;   (printout t ?pn " was bought " crlf))
;;
;;
;;;;Define a rule for finding which products have been bought AND their quantity
;;
;;(defrule prods-qty-bgt
;;   (order (order-number ?order))
;;   (line-item (order-number ?order) (part-number ?part) (quantity ?q))
;;   (product (part-number ?part) (name ?p) )
;;   =>
;;   (printout t ?q " " ?p " was/were bought " crlf))
;;
;;;;Define a rule for finding customers and their shopping info
;;
;;(defrule customer-shopping
;;   (customer (customer-id ?id) (name ?cn))
;;   (order (order-number ?order) (customer-id ?id))
;;   (line-item (order-number ?order) (part-number ?part))
;;   (product (part-number ?part) (name ?pn))
;;   =>
;;   (printout t ?cn " bought  " ?pn crlf))
;;
;;;;Define a rule for finding those customers who bought more than 5 products
;;
;;(defrule cust-5-prods
;;   (customer (customer-id ?id) (name ?cn))
;;   (order (order-number ?order) (customer-id ?id))
;;   (line-item (order-number ?order) (part-number ?part) {quantity > 5})
;;   (product (part-number ?part) (name ?pn))
;;   =>
;;   (printout t ?cn " bought more than 5 products (" ?pn ")" crlf))
;;
;;;; Define a rule for texting custormers who have not bought ...
;;
;;(defrule text-cust 
;;   (customer (customer-id ?cid) (name ?name) (phone ?phone))
;;   (not (order (order-number ?order) (customer-id ?cid)))
;;   =>
;;   (assert (text-customer ?name ?phone "tienes 25% desc prox compra"))
;;   (printout t ?name " 3313073905 tienes 25% desc prox compra" )
;;)
;;
;;
;;;; Define a rule for calling  custormers who have not bought ...
;;(defrule call-cust 
;;            (customer (customer-id ?cid) (name ?name) (phone ?phone))
;;            (not (order (order-number ?order) (customer-id ?cid)))
;;=>
;;(assert (call-customer ?name ?phone "tienes 25% desc prox compra"))
;;(printout t ?name " 3313073905 tienes 25% desc prox compra" ))
;;


;;-------------------------------HANDS ON 3 ---------------------

;;(defrule nombre-regla
;;   (patrón1)
;;   (patrón2)
;;   =>
;;   (acción1)
;;   (acción2)
;;)
;;
;;regla 1 muestra en pantalla si un cliente es masculino
(defrule cliente-m
   (cliente (nombre ?n)(sexo M))
      =>
   (printout t crlf ?n " Es un cliente Masculino" crlf)
)

;;regla 2 muestra en pantalla si un cliente es femenino
(defrule cliente-f
   (cliente (nombre ?n)(sexo F))
   =>
   (printout t crlf ?n " Es un cliente Femenino" crlf)
)

;; regla 3 muestra en pantalla los smartphones de gama baja
(defrule smartphone-calidad-baja
   (smartphone (marca ?n) (modelo ?modelo) (precio ?p))
   (test (< ?p 5000))
   =>
   (printout t crlf ?n " " ?modelo " Es calidad Gama Baja" crlf)
)
;; regla 4 muestra en pantalla los smartphones de gama media
(defrule smartphone-calidad-media
   (smartphone (marca ?n) (modelo ?modelo) (precio ?p))
   (test (>= ?p 5000))
   (test (<= ?p 10000))
   =>
   (printout t crlf ?n " " ?modelo " Es calidad Gama Media" crlf)
)
;; regla 5 muestra en pantalla los smartphones de gama alta
(defrule smartphone-calidad-alta
   (smartphone (marca ?n) (modelo ?modelo) (precio ?p))
   (test (> ?p 10000))
   =>
   (printout t crlf ?n " " ?modelo " Es calidad Gama Alta" crlf)
)

;; regla 6  cliente que consume smartphones se muestra en pantalla
(defrule cliente-smartphone
   (cliente (cliente-id ?idcliente) (nombre ?nombre))
   (orden-compra (cliente-id ?idcliente) (orden-compra-id ?idcompra))
   (line-item-s (cliente-id ?idcliente) (orden-compra-id ?idcompra) (smartphone-id ?idsmartphone))
   =>
   (printout t crlf ?nombre " este cliente consume Smartphones" crlf)
)

;; regla 7  cliente que consume computadores se muestra en pantalla
(defrule cliente-computador
   (cliente (cliente-id ?idcliente) (nombre ?nombre))
   (orden-compra (cliente-id ?idcliente) (orden-compra-id ?idcompra))
   (line-item-c (cliente-id ?idcliente) (orden-compra-id ?idcompra) (computador-id ?idcomputador)) 
   =>
   (printout t crlf ?nombre " este cliente consume Computadores" crlf)
)

;; regla 8  cliente que consume accesorios se muestra en pantalla
(defrule cliente-accesorio
   (cliente (cliente-id ?idcliente) (nombre ?nombre))
   (orden-compra (cliente-id ?idcliente) (orden-compra-id ?idcompra))
   (line-item-aa (cliente-id ?idcliente) (orden-compra-id ?idcompra) (accesorio-id ?idaccesorio)) 
   =>
   (printout t crlf ?nombre " este cliente consume accesorios" crlf)
)

;; regla 9 si un cliente ha comprado mas de tres productos smartphones
(defrule mayoreo-smartphone
   (cliente (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular))
   (orden-compra (orden-compra-id ?idcompra) (cliente-id ?idcliente))
   (smartphone (smartphone-id ?idsmartphone)(marca ?nombresmartphone))

   (line-item-s (orden-compra-id ?idcompra) (smartphone-id ?idsmartphone) (cliente-id ?idcliente) (cantidad ?csmartphone))
   
   (test(> ?csmartphone 3))
   =>
   ;;(printout t ?nombre " cliente de mayoreo en smartphones" crlf)
   (assert (cliente-mayorista ?idcliente ?nombre ?celular ?nombresmartphone))
)

;; regla 10 si un cliente ha comprado mas de tres productos computadores
(defrule mayoreo-computador
   (cliente (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular))
   (orden-compra (orden-compra-id ?idcompra) (cliente-id ?idcliente))
   (computador (computador-id ?idcomputador)(marca ?nombrecomputador))

   (line-item-c (orden-compra-id ?idcompra) (computador-id ?idcomputador) (cliente-id ?idcliente) (cantidad ?ccomputador ))
   
   (test(> ?ccomputador 3))
   =>
   ;;(printout t ?nombre " cliente de mayoreo en smartphones" crlf)
   (assert (cliente-mayorista ?idcliente ?nombre ?celular ?nombrecomputador))
)

;; regla 11 si un cliente ha comprado mas de tres productos accesorios
(defrule mayoreo-accesorio
   (cliente (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular))
   (orden-compra (orden-compra-id ?idcompra) (cliente-id ?idcliente))
   (accesorio (accesorio-id ?idaccesorio)(marca ?nombreaccesorio))

   (line-item-aa (orden-compra-id ?idcompra) (accesorio-id ?idaccesorio) (cliente-id ?idcliente) (cantidad ?caccesorio))
   
   (test(> ?caccesorio 3))
   =>
   ;;(printout t ?nombre " cliente de mayoreo en smartphones" crlf)
   (assert (cliente-mayorista ?idcliente ?nombre ?celular ?nombreaccesorio))
)

;; regla 12 si un cliente ha comprado menos o igual de tres productos smartphones
(defrule minoreo-smartphone
   (cliente (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular))
   (orden-compra (orden-compra-id ?idcompra) (cliente-id ?idcliente))
   (smartphone (smartphone-id ?idsmartphone)(marca ?nombresmartphone))

   (line-item-s (orden-compra-id ?idcompra) (smartphone-id ?idsmartphone) (cliente-id ?idcliente) (cantidad ?csmartphone))
   
   (test(<= ?csmartphone 3))
   =>
   ;;(printout t ?nombre " cliente de mayoreo en smartphones" crlf)
   (assert (cliente-minorista ?idcliente ?nombre ?celular ?nombresmartphone))
)

;; regla 13 si un cliente ha comprado menos o igual de tres productos computadores
(defrule minoreo-computador
   (cliente (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular))
   (orden-compra (orden-compra-id ?idcompra) (cliente-id ?idcliente))
   (computador (computador-id ?idcomputador)(marca ?nombrecomputador))

   (line-item-c (orden-compra-id ?idcompra) (computador-id ?idcomputador) (cliente-id ?idcliente) (cantidad ?ccomputador ))
   
   (test(<= ?ccomputador 3))
   =>
   ;;(printout t ?nombre " cliente de mayoreo en smartphones" crlf)
   (assert (cliente-minorista ?idcliente ?nombre ?celular ?nombrecomputador))
)

;; regla 14 si un cliente ha comprado menos o igual de tres productos accesorios
(defrule minoreo-accesorio
   (cliente (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular))
   (orden-compra (orden-compra-id ?idcompra) (cliente-id ?idcliente))
   (accesorio (accesorio-id ?idaccesorio)(marca ?nombreaccesorio))

   (line-item-aa (orden-compra-id ?idcompra) (accesorio-id ?idaccesorio) (cliente-id ?idcliente) (cantidad ?caccesorio))
   
   (test(<= ?caccesorio 3))
   =>
   ;;(printout t ?nombre " cliente de mayoreo en smartphones" crlf)
   (assert (cliente-minorista ?idcliente ?nombre ?celular ?nombreaccesorio))
)

;;----------------------------------------------------------------------
;;relga 15 por comprar smartphone marca xiaomi obtiene descuento
(defrule descuento-smartphone-xiaomi
   (cliente (cliente-id ?clienteid)(nombre ?nombre))
   (orden-compra (orden-compra-id ?ordenid)(cliente-id ?clienteid))
   (smartphone (smartphone-id ?smartphoneid) (marca xiaomi))
   (line-item-s (orden-compra-id ?ordenid)(cliente-id ?clienteid)(smartphone-id ?smartphoneid))
   (vale-compra (vale-id 3)(vale ?vale))
   =>
   (printout t ?nombre " "?vale " por comprar smartphone xiaomi"  crlf)
)

;;regla 16 por comprar mas de dos smartphones tiene descuento
(defrule descuento-smartphone-xiaomi
   (cliente (cliente-id ?clienteid)(nombre ?nombre))
   (orden-compra (orden-compra-id ?ordenid)(cliente-id ?clienteid))
   (smartphone (smartphone-id ?smartphoneid) (marca ?marca))
   (line-item-s (orden-compra-id ?ordenid)(cliente-id ?clienteid)(smartphone-id ?smartphoneid)(cantidad ?cantidad))
   (test (> ?cantidad 2))
   (vale-compra (vale-id 4)(vale ?vale))
   =>
   (printout t "por comprar " ?cantidad " el cliente "?nombre " tiene un "?vale " en total" crlf )
)

;;regla 17 por tarjeta el cliente tiene meses sin intereses
(defrule cliente-tarjeta
   (cliente (cliente-id ?clienteid)(nombre ?nombre))
   (tarjeta-credito (cliente-id ?clienteid) (banco ?banco)(grupo ?grupo))
   (test (eq ?banco "bbva"))
   (test (eq ?grupo "visaBlue"))
   (vale-compra (vale-id 6) (vale ?vale))
   =>
   (printout t "cliente " ?nombre " con tarjeta "?banco" "?grupo" tiene: "?vale crlf)
)

;;regla 18 por tarjeta 
(defrule cliente-tarjeta
   (cliente (cliente-id ?clienteid)(nombre ?nombre))
   (tarjeta-credito (cliente-id ?clienteid) (banco ?banco)(grupo ?grupo))
   (test (eq ?banco "bbva"))
   (test (eq ?grupo "visaRed"))
   (vale-compra (vale-id 7) (vale ?vale))
   =>
   (printout t "cliente " ?nombre " con tarjeta "?banco" "?grupo" tiene: "?vale crlf)
)

;;regla 19 si un cliente no ha realizado pedido aun.
(defrule cliente-comprar
   (cliente (cliente-id ?clienteid) (nombre ?nombre))
   (not (orden-compra (orden-compra-id ?ordenid)(cliente-id ?clienteid)))
   =>
   (printout t ?nombre " no ha realizado pedido de compra" crlf)
)

;;regla 20 descuento por una fecha en especifica 
(defrule fecha-descuento
   (cliente (cliente-id ?clienteid)(nombre ?nombre))
   (orden-compra (orden-compra-id ?ordenid)(cliente-id ?clienteid) (fecha ?fecha)) 
   (test (eq ?fecha "10-01-2022"))
   (vale-compra (vale-id 1) (vale ?vale))
   => 
   (printout t ?nombre " obtiene "?vale " por comprar la fecha: "?fecha)
)


;;;; Regla general para clientes mayoristas
;;(defrule cliente-mayorista
;;   (cliente (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular))
;;   (orden-compra (orden-compra-id ?idcompra) (cliente-id ?idcliente))
;;   (producto (producto-id ?idproducto)(nombre ?nombreproducto))
;;
;;   (line-item (orden-compra-id ?idcompra) (producto-id ?idproducto) (cliente-id ?idcliente) (cantidad ?cantidad))
;;   
;;   (test(> ?cantidad 3))
;;   =>
;;   (assert (cliente-mayorista ?idcliente ?nombre ?celular ?nombreproducto))
;;)
;;
;;;; Uso de la regla general para smartphones
;;(defrule mayoreo-smartphone
;;   (cliente-mayorista (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular)(nombreproducto ?nombresmartphone))
;;   (smartphone (smartphone-id ?idsmartphone)(nombre ?nombresmartphone))
;;   =>)
;;
;;;; Uso de la regla general para computadores
;;(defrule mayoreo-computador
;;   (cliente-mayorista (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular)(nombreproducto ?nombrecomputador))
;;   (computador (computador-id ?idcomputador)(nombre ?nombrecomputador))
;;   =>)
;;
;;;; Uso de la regla general para accesorios
;;(defrule mayoreo-accesorio
;;   (cliente-mayorista (cliente-id ?idcliente)(nombre ?nombre)(celular ?celular)(nombreproducto ?nombreaccesorio))
;;   (accesorio (accesorio-id ?idaccesorio)(nombre ?nombreaccesorio))
;;   =>)
;;
;;










;;
;;
;;
;;
;;;;----------------------------------------------------------------------
;;;; regla 6 regla clientes que han comprado más de 4 productos en total
;;(defrule clientes-mayoristas
;;   (cliente (cliente-id ?idcliente)(nombre ?nombre))
;;   (orden-compra (compra-id ?idcompra) (cliente-id ?idcliente))
;;   (or (line-item-s (orden-compra-id ?order) (cliente-id ?idcliente) (cantidad ?csmartphone))
;;      (bind ?csmartphone 0)) ;; Asigna 0 si el patrón line-item-s no se cumple
;;   (or (line-item-c (orden-compra-id ?order) (cliente-id ?idcliente) (cantidad ?ccomputador))
;;      (bind ?ccomputador 0)) ;; Asigna 0 si el patrón line-item-c no se cumple
;;   (or (line-item-aa (orden-compra-id ?order) (cliente-id ?idcliente) (cantidad ?caccesorio))
;;      (bind ?caccesorio 0)) ;; Asigna 0 si el patrón line-item-aa no se cumple
;;
;;   ?total <- (+ ?csmartphone ?ccomputador ?caccesorio)
;;   (test (> ?total 4))
;;   =>
;;   if(> ?total 4)
;;      then (assert (menudista ?nombre))
;;      else ((printout t ?nombre " no es un cliente de mayoreo" crlf))
;;)
;;
;;;;----------------------------------------------------------------------
;;
;;
;;;; regla 6 regla clientes que han comprado más de 4 productos en total
;;(defrule clientes-mayoristas
;;   (cliente (cliente-id ?idcliente)(nombre ?nombre))
;;   (orden-compra (compra-id ?idcompra) (cliente-id ?idcliente))
;;   (or (line-item-s (orden-compra-id ?order) (cliente-id ?idcliente) (cantidad ?csmartphone))
;;      (bind ?csmartphone 0)) ;; Asigna 0 si el patrón line-item-s no se cumple
;;   (or (line-item-c (orden-compra-id ?order) (cliente-id ?idcliente) (cantidad ?ccomputador))
;;      (bind ?ccomputador 0)) ;; Asigna 0 si el patrón line-item-c no se cumple
;;   (or (line-item-aa (orden-compra-id ?order) (cliente-id ?idcliente) (cantidad ?caccesorio))
;;      (bind ?caccesorio 0)) ;; Asigna 0 si el patrón line-item-aa no se cumple
;;
;;   ?total <- (+ ?csmartphone ?ccomputador ?caccesorio)
;;   (test (> ?total 4))
;;   =>
;;   if(> ?total 4)
;;      then (assert (menudista ?nombre))
;;      else ((printout t ?nombre " no es un cliente de mayoreo" crlf))
;;)
;;
;;
;;(defrule cliente-shopping
;;   (cliente (cliente-id ?id) (nombre ?cn))
;;   (orden-compra (order-id ?orden) (cliente-id ?id))
;;   (line-item (order-number ?order) (part-number ?part))
;;   (product (part-number ?part) (name ?pn))
;;   =>
;;   (printout t ?cn " bought  " ?pn crlf))
;;
;;
;;(if (> ?x 5)
;;    then (printout t "x es mayor que 5" crlf)
;;    else (printout t "x no es mayor que 5" crlf))
;;
;;
;;
;;(defrule text-cust 
;;   (customer (customer-id ?cid) (name ?name) (phone ?phone))
;;   (not (order (order-number ?order) (customer-id ?cid)))
;;   =>
;;   (assert (text-customer ?name ?phone "tienes 25% desc prox compra"))
;;   (printout t ?name " 3313073905 tienes 25% desc prox compra" )
;;)
;;
;;
;;(defrule clientes-mayoristas-todos-productos
;;   (cliente (cliente-id ?idcliente)(nombre ?nombre))
;;   (orden-compra (compra-id ?idcompra) (cliente-id ?idcliente) (cliente-id ?idcliente))
;;   (line-item-s (orden-compra-id ?order) (cliente-id ?idcliente) (cantidad ?csmartphone))
;;   (line-item-c (orden-compra-id ?order) (cliente-id ?idcliente) (cantidad ?ccomputador))
;;   (line-item-aa (orden-compra-id ?order) (cliente-id ?idcliente) (cantidad ?caccesorio))
;;
;;   ?total <- (+ ?csmartphone ?ccomputador ?caccesorio)
;;   (test (> ?total 3))
;;   =>
;;   (assert(menudista ?nombre ))
;;)
;;

