;;iniciamos con los objetos iniciales
(defrule inicio
    =>
    (assert (monkey (hambriento sí) (animo enojado) (estado "En el piso") (estado-manos libres)))
    (assert (silla (estado "En el piso")))
    (assert (escritorio (estado "En el piso")))
    (assert (banana (estado "En el techo")))
;;    (printout t "El mono inicia en el piso" crlf)
    (printout t "(monkey (hambriento sí) (animo enojado) (estado "En el piso") (estado-manos libres)))"crlf)
    (printout t "(banana (estado "En el techo")))"crlf)
    (printout t "(silla (estado "En el piso")))" crlf)
    (printout t "(escritorio (estado "En el piso")))"crlf crlf)
)


;;el mono salto desde el piso pero no pudo alcanzar las bananas
(defrule salto-piso-fallido
    (monkey (estado "En el piso"))
    =>
    (printout t "El mono salto desde el piso y no consiguio las bananas" crlf)
)

;;el mono salto desde la silla
(defrule salto-silla-fallido
    (monkey (estado "En la silla"))
    =>
    (printout t "El mono salto desde la silla y no consiguio las bananas" crlf )
)

;;el mono salto desde el escritorio
(defrule salto-escritorio-fallido
    (monkey (estado "En el escritorio"))
    =>
    (printout t "El mono salto desde el escritorio y no consiguio las bananas" crlf)
)


;;el mono pasa a la silla desde el suelo
(defrule salto-silla
    ?estado <- (monkey(estado "En el piso"))
    (silla (estado "En el piso"))
    =>
    (modify ?estado (estado "En la silla"))

    (printout t "el mono pasa a la silla desde el suelo" crlf)
)

;;el mono pasa al escritorio desde la silla
(defrule salto-escritorio
    ?estado <- (monkey(estado "En la silla"))
    (escritorio (estado "En el piso"))
    =>
    (modify ?estado (estado "En el escritorio"))
    
    (printout t "el mono pasa al escritorio desde la silla" crlf)
)

;;el mono pasa la silla al escritorio
(defrule silla-aa-escritorio
    ?manos <- (monkey (estado "En el escritorio")(estado-manos libres))
    (escritorio (estado "En el piso"))
    ?estado-silla <- (silla (estado "En el piso"))
    =>
    (modify ?manos (estado-manos ocupadas))
    (modify ?estado-silla (estado "En el escritorio"))

    (printout t "el mono pasa la silla al escritorio" crlf)
)

;;el mono se sube a la silla que esta sobre del escritorio
(defrule monkey-silla-escritorio
    ?mono <- (monkey (estado "En el escritorio")(estado-manos ocupadas))
    (silla (estado "En el escritorio"))
    =>
    (modify ?mono (estado "En la silla sobre la mesa")(estado-manos libres))

    (printout t "el mono se sube a la silla que esta sobre del escritorio"crlf)
)

;;el mono salta para tomar las bananas desde la silla sobre el escritorio
(defrule monkey-banana-salto
    ?mono-estado <- (monkey (estado "En la silla sobre la mesa"))
    (silla (estado "En el escritorio"))
    (escritorio (estado "En el piso"))
    =>
    (modify ?mono-estado (estado "En el aire"))

    (printout t "el mono salta para tomar las bananas desde la silla sobre el escritorio"crlf)
)

;;el mono tiene las bananas
(defrule monkey-banana
    ?mono <- (monkey (estado "En el aire")(estado-manos libres)(hambriento sí)(animo enojado))
    ?bana <- (banana (estado "En el techo"))
    (silla (estado "En el escritorio"))
    (escritorio (estado "En el piso"))
    =>
    (modify ?mono (estado "En la silla y comiendo")(estado-manos ocupadas)(hambriento no)(animo feliz))
    (modify ?bana (estado "En manos del mono"))
    
    (printout t "el mono tiene las bananas" crlf)
)

;;el mono esta comiendo las bananas en la silla que esta sobre el escritorio
(defrule Final
    (monkey (estado "En la silla y comiendo")(estado-manos ocupadas)(hambriento no)(animo feliz))
    (banana (estado "En manos del mono"))
    (silla (estado "En el escritorio"))
    (escritorio (estado "En el piso"))
    =>
    (printout t "el mono esta comiendo las bananas en la silla que esta sobre el escritorio"crlf crlf)
    (printout t "(monkey (estado "En la silla y comiendo")(estado-manos ocupadas)(hambriento no)(animo feliz))"crlf)
    (printout t "(banana (estado "En manos del mono"))"crlf)
    (printout t "(silla (estado "En el escritorio"))"crlf)
    (printout t "(escritorio (estado "En el piso"))"crlf)

)