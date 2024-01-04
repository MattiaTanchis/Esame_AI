(define (domain StealthyMoves)

    (:requirements :equality :disjunctive-preconditions :negative-preconditions :typing :conditional-effects
    )

    (:types
        creature location - object
        cat rat - creature
    )

    (:predicates
        (on ?v - creature ?x - location ?y - location)
        (full ?x - location ?y - location)
        (move ?b - location ?a - location)
        (visited ?r - creature ?x - location ?y - location)
    )

    ; rat = 1 location 
    ; Questi parametri, Precondizioni e effetti sono definiti per la funzione sottostante (rat-left-or-right)
    ; Parametri:
    ; - ?r : il topo da spostare
    ; - ?x ?y : la posizione attuale del topo che desideriamo spostare
    ; - ?next_x : la coordinata x dove dovrebbe andare il topo dopo lo spostamento
    ;
    ;  Precondizioni
    ; - il topo si deve trovare nel punto di coordinate x y passate come parametri
    ; - Il punto di coordinata next_x y non deve essere occupato da nessuno
    ; - se il punto di coordinata next_x y è libero il topo verrà spostato verso dx o sx 
    ;
    ; Effetti:
    ; - Il topo sarà nella posizione di coordinata next_x y che diventerà occupata, la posizione precedente diventerà libera
    ;   

    (:action rat-left-or-right
        :parameters (?r - rat ?y - location ?x - location ?next_x - location)
        :precondition (and
            (on ?r ?x ?y)
            (not (full ?next_x ?y))
            (or 
                (move ?next_x ?x) 
                (move ?x ?next_x) 
            )
        )
        :effect (and
            (on ?r ?next_x ?y)
            (full ?next_x ?y)
            (not (on ?r ?x ?y))
            (not (full ?x ?y))
            (visited ?r ?next_x ?y)
        )
    )
; spiegazione funzione: Le precondizioni sono --> il topo si deve trovare in x y (on ?r ?x ?y) e la posizione 
; next_x y non deve essere piena (not (full ?next_x ?y)) e il topo si spostarà verso dx o verso sx 
; (move ?next_x ?x) (move ?x ?next_x).
; effetti: il topo si troverà nella posizione next_x y e questa posizione diventerà piena (on ?r ?next_x ?y) (full ?next_x ?y)
; e la posizione precedente del topo verrà aggiornata diventando libera (not (on ?r ?x ?y)) (not (full ?x ?y))


    ; rat = 1 location
    ; Parametri:
    ; - ?r : il topo da spostare
    ; - ?x ?y : la posizione attuale del topo che desideriamo spostare
    ; - ?next_y : la coordinata y dove dovrebbe andare il topo dopo lo spostamento
    ;
    ;   Precondizioni
    ; - il topo si deve trovare nel punto di coordinate x y passate come parametri
    ; -  Il punto di coordinata x next_y non deve essere occupato da nessuno
    ; - se il punto di coordinata x next_y è libero il topo verrà spostato verso sopra o sotto 
    ;
    ;  Effetti:
    ; - Il topo sarà nella posizione di coordinata next_x y che diventerà occupata, la posizione precedente diventerà libera

    (:action rat-up-or-down
        :parameters (?r - rat ?x - location ?y - location ?next_y - location)
        :precondition (and
            (on ?r ?x ?y)
            (not (full ?x ?next_y))
            (or 
                (move ?next_y ?y) ; The rat will move to the left
                (move ?y ?next_y) ; The rat will move to the right
            )

        )
        :effect (and
            (on ?r ?x ?next_y)
            (full ?x ?next_y)
            (not (on ?r ?x ?y))
            (not (full ?x ?y))
            (visited ?r ?x ?next_y)
        )
    )
    

   
   
)
