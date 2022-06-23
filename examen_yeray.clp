
(deffacts datos
    (max_movimientos 56 )
    (robot movimientos 0 brazo)
    (max_encima 3)
    (bloque A bloquesencima)
    (bloque B bloquesencima)
    (bloque C bloquesencima)
    (bloque D bloquesencima)
    (bloque E bloquesencima))


(defrule desapilar_bloque
    ?f1 <- (robot movimientos ?m brazo $?llevabloque)
    ?f2 <- (bloque ?letra bloquesencima $?bloquesencima bloque ?letrabloquetop $?bloquesencimadelbloque)
    (test (= (length $?llevabloque) 0))
    (test (= (length $?bloquesencimadelbloque) 0))
    =>
    (retract ?f1)
    (retract ?f2)
    (assert (robot movimientos ?m brazo bloque ?letrabloquetop))
    (assert (bloque ?letra bloquesencima $?bloquesencima bloque ?letrabloquetop $?bloquesencimadelbloque))
    ( printout t"bloque desapilado" crlf)
)