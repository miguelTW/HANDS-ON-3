
;;
;;(deftemplate customer
;;  (slot customer-id)
;;  (multislot name)
;;  (multislot address)
;;  (slot phone)
;;)
;;
;;(deftemplate product
;;  (slot part-number)
;;  (slot name)
;;  (slot category)
;;  (slot price)
;;)
;;
;;(deftemplate order
;;  (slot order-number)
;;  (slot customer-id)
;;)
;;
;;(deftemplate line-item
;;  (slot order-number)
;;  (slot part-number)
;;  (slot customer-id)
;;  (slot quantity (default 1))
;;)
;;
;;;;/*--------------------------------------------*/
;;;;TAREA DEL HANDS ON 3
;;;; PLANTILLAS PARA CREAR EL SISTEMA BIEN BASADO
;;
;;ya esta terminado
(deftemplate smartphone
    (slot smartphone-id)
    (slot marca)
    (slot modelo)
    (slot precio (type INTEGER))
    (slot almacenamiento)
    (slot bateria)
    (slot peso)
    (slot color)
)

;;ya esta terminado
(deftemplate computador
    (slot computador-id)
    (slot marca)
    (slot modelo)
    (slot precio (type INTEGER))
    (slot so)
    (slot almacenamiento)
    (slot bateria)
    (slot peso)
    (slot color)
)

;;ya esta terminado
(deftemplate accesorio
    (slot accesorio-id)
    (slot marca)
    (slot modelo)
    (slot precio (type INTEGER))
    (slot color)
)

;;ya esta terminado
(deftemplate tarjeta-credito
    (slot banco)
    (slot grupo)
    (slot fecha-expiracion)
    (slot numero-tarjeta)
    (slot cliente-id)
)
;;ya esta terminado
(deftemplate cliente
    (slot cliente-id)
    (multislot nombre)
    (slot edad)
    (slot celular)
    (slot sexo)
    (multislot direccion)
)
;;ya esta terminado
(deftemplate orden-compra
    (slot fecha)
    (slot orden-compra-id)
    (slot cliente-id)
)
;;ya esta terminado
(deftemplate line-item-s
    (slot orden-compra-id)
    (slot smartphone-id)
    (slot cliente-id)
    (slot cantidad (type INTEGER)))
;;ya esta terminado
(deftemplate line-item-c
    (slot orden-compra-id)
    (slot computador-id)
    (slot cliente-id)
    (slot cantidad (type INTEGER)))
;;ya esta terminado
(deftemplate line-item-aa
    (slot orden-compra-id)
    (slot accesorio-id)
    (slot cliente-id)
    (slot cantidad (type INTEGER)))

(deftemplate vale-compra
    (slot vale-id)
    (slot vale)
)


;;;;----------------------listo tres reglas
;;tipo de producto consumido
;;(tp-id)
;;(cliente-id)
;;(producto-id (puede ser s c or a))
;;;;----------------- listo tres reglas
;;menudistas
;;(menudita-id)
;;(cliente-id)
;;;;-------------------- listro tres reglas
;;mayoristas
;;(mayorista-id)
;;(cliente-id)


;;(deftemplate orden-compra
;;    (slot fecha)
;;    (slot orden-compra-id)
;;    (slot cliente-id)
;;    (multislot producto)
;;    (multislot cantidad)
;;    (multislot total-producto)
;;    (slot total-compra)
;;)