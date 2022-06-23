
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
    (test (eq $?llevabloque ''))
    (test (eq $?bloquesencimadelbloque ''))
    =>
    (retract ?f1)
    (retract ?f2)
    (assert (robot movimientos ?m brazo bloque ?letrabloquetop $?bloquesencimadelbloque))
    (assert (bloque ?letra bloquesencima $?bloquesencima ))
    (assert (bloque ?letrabloquetop))
    ( printout t"bloque desapilado" crlf)
)


(defrule coger_bloque
    ?f1 <- (robot movimientos ?m brazo $?llevabloque)
    ?f2 <- (bloque ?letra bloquesencima $?bloquesencima)
    (test (eq $?llevabloque ''))
    (test (eq $?bloquesencima ''))
    =>
    (retract ?f1)
    (retract ?f2)
    (assert (robot movimientos ?m brazo bloque ?letra bloquesencima $?bloquesencima))
    ( printout t"bloque cogido" crlf)
)

(defrule dejar_bloque
    ?f1 <- (robot movimientos ?m brazo $?llevabloque)
    (test (neq $?llevabloque '')) ;; comprueba que lleva el bloque
    =>
    ( printout t"bloque cogido" crlf)

)


;; (defrule dejar_bloque
;;     ?f1 <- (robot movimientos ?m brazo $?llevabloque)
;;     (test (neq $?llevabloque '')) ;; comprueba que lleva el bloque
;;     =>
;;     (retract ?f1)
;;     (assert (robot movimientos ?m brazo)) ;; quita el bloque
;;     (assert ($?llevabloque)) ;; pone el bloque en la mesa
;;     ( printout t"bloque puesto en la mesa" crlf)
;; )