
;; (deffacts datos
;;     (max_movimientos 56 )
;;     (robot movimientos 0 brazo)
;;     (max_encima 3)
;;     (bloque A)
;;     (bloque B)
;;     (bloque C)
;;     (bloque D)
;;     (bloque E))


(deffacts basedehechos
    (max_movimientos 56 )
    (robot movimientos 0 brazo)
    (max_encima 3)
    (bloque C bloque B bloque A)
    (bloque D bloque E))

(defrule desapilar_bloque
    ?f1 <- (robot movimientos ?m brazo $?llevabloque)
    ?f2 <- (bloque ?letra $?bloquesencima bloque ?letrabloquetop $?bloquesencimadelbloque)
    (test (and(= (length$ $?llevabloque) 0)(=(length$ $?bloquesencimadelbloque) 0)))
    =>
    (retract ?f1)
    (retract ?f2)
    (assert (robot movimientos ?m brazo bloque ?letrabloquetop $?bloquesencimadelbloque))
    (assert (bloque ?letra $?bloquesencima ))
    ( printout t"bloque desapilado" crlf)
)

(defrule apilar_bloque
    ?f1 <- (robot movimientos ?m brazo $?llevabloque)
    ?f2 <- (bloque ?letra $?bloquesencima)
    (test (and(<> (length$ $?llevabloque) 0)(=(length$ $?bloquesencima) 0)))
    =>
    (retract ?f1)
    (retract ?f2)
    (assert (robot movimientos ?m brazo))
    (assert (bloque ?letra $?bloquesencima $?llevabloque))
    ( printout t"bloque apilado" crlf)
)

(defrule coger_bloque
    ?f1 <- (robot movimientos ?m brazo $?llevabloque)
    ?f2 <- (bloque ?letra $?bloquesencima)
    (test (and(=(length$ $?llevabloque) 0)(=(length$ $?bloquesencima) 0)))
    =>
    (retract ?f1)
    (retract ?f2)
    (assert (robot movimientos ?m brazo bloque ?letra $?bloquesencima))
    ( printout t"bloque cogido" crlf)
)

(defrule dejar_bloque
    ?f1 <- (robot movimientos ?m brazo bloque ?letra $?bloquesencima)
    =>
    (retract ?f1)
    (assert (robot movimientos ?m brazo)) ;; quita el bloque
    (assert (bloque ?letra $?bloquesencima)) ;; pone el bloque en la mesa
    ( printout t"bloque puesto en la mesa" crlf)

)

(defrule fin
    (salience 100)
    ?f1 <- (bloque A bloque E bloque B bloque D)
    ?f2 <- (bloque C)
    =>
    ( printout t"terminado" crlf)
    (halt)
)