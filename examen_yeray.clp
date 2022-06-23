
(deffacts datos
    (max_movimientos 56 )
    (robot movimientos 0 brazo)
    (max_encima 3)
    (bloque A bloquesencima)
    (bloque B bloquesencima)
    (bloque C bloquesencima)
    (bloque D bloquesencima)
    (bloque E bloquesencima))


(defrule desapilar_cajas
    ?f1 <- (robot movimientos ?m brazo $?llevabloque)
    ?f1 <- (bloque ?letra bloquesencima $?bloquesencima)
    =>
    ( printout t"paquetes recogidos" crlf)
)