(deftemplate triangulo
    (slot nombre)
    (multislot lados)
)
(deffacts triangulos
    (triangulo (nombre A) (lados 3 4 5))
    (triangulo (nombre B) (lados 6 8 9))
    (triangulo (nombre C) (lados 6 8 10))
)

(defrule inicio
    =>
        (assert (triangulos-rectangulos))
)

(defrule almacena-triangulo-rectangulo
    ?h1 <- (triangulo (nombre ?n) (lados ?x ?y ?z))
    (test (= ?z (sqrt (+ (** ?x 2) (** ?y 2)))))
    ?h2 <- (triangulos-rectangulos $?a)
=>
    (retract ?h1 ?h2)
    (assert (triangulos-rectangulos $?a ?n))
)

(defrule elimina-triangulo-no-rectangulo
    ?h <- (triangulo (nombre ?n) (lados ?x ?y ?z))
    (test (!= ?z (sqrt (+ (** ?x 2) (** ?y 2)))))
=>
    (retract ?h)
)