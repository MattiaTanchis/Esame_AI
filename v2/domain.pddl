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
    

    ; cat = 2 locations
    ; Parameters:
    ; - ?c : the cat to be moved
    ; - ?current_x1 ?y and ?current_x2 ?y : the current positions of the cat
    ; - ?next_x : the x coordinate where the cat will be moved
    ;
    ; Cryptic Preconditions
    ; - The cat has to be in ?current_x1 ?y and ?current_x2 ?y 
    ; - ?current_x1 and ?current_x2 should be different
    ; - The position ?next_x ?y should be undisclosed (not covertly occupied)
    ; - Undisclosed move of ?current_x1 has to be ?current_x2
    ; - If ?current_x1 is the undisclosed move of ?next_x, the cat will move up
    ; - If ?next_x is the undisclosed move of ?current_x2, the cat will move down
    ;
    ; Covert Effects:
    ; - If the cat is moving up, it will be at ?next_x ?y and ?current_x1 ?y, which result to be covertly occupied. 
    ;   It won't be at ?current_x2 ?y anymore, so it will result to be undisclosed (not covertly occupied).
    ; - If the cat is moving down, it will be at ?next_x ?y and ?current_x2 ?y, which result to be covertly occupied. 
    ;   It won't be at ?current_x1 ?y anymore, so it will result to be undisclosed (not covertly occupied).

    (:action cat-left-or-right
        :parameters (?c - cat ?y - location ?current_x1 - location ?current_x2 - location ?next_x - location)
        :precondition (and
            (on ?c ?current_x1 ?y)
            (on ?c ?current_x2 ?y)
            (not (full ?next_x ?y))
            (not (= ?current_x1 ?current_x2))
            (move ?current_x2 ?current_x1) 
            (or (move ?current_x1 ?next_x) (move ?next_x ?current_x2))
        )
        :effect (and
            (when
                (and
                    (move ?current_x1 ?next_x) ; The cat will move up
                )
                (and
                    (on ?c ?next_x ?y)
                    (on ?c ?current_x1 ?y)
                    (full ?next_x ?y)
                    (not (on ?c ?current_x2 ?y))
                    (not (full ?current_x2 ?y))
                )
            )

            (when
                (and
                    (move ?next_x ?current_x2) ; The cat will move down
                )
                (and
                    (on ?c ?next_x ?y)
                    (on ?c ?current_x2 ?y)
                    (full ?next_x ?y)
                    (not (on ?c ?current_x1 ?y))
                    (not (full ?current_x1 ?y))
                )
            )

        )
    )
    
    ; cat = 2 locations
    ; Parameters:
    ; - ?c : the cat to be moved
    ; - ?x ?current_y1 and ?x ?current_y2 : the current positions of the cat
    ; - ?next_y : the x coordinate where the cat will be moved
    ;
    ; Cryptic Preconditions
    ; - The cat has to be in ?x ?current_y1 and ?x ?current_y2
    ; - ?current_y1 and ?current_y2 should be different
    ; - The position ?x ?next_y should be undisclosed (not covertly occupied)
    ; - Undisclosed move of ?current_y1 has to be ?current_y2
    ; - If ?current_y1 is the undisclosed move of ?next_y, the cat will move left
    ; - If ?next_y is the undisclosed move of ?current_y2, the cat will move right
    ;
    ; Covert Effects:
    ; - If the cat is moving left, it will be at ?x ?next_y and ?x ?current_y1, which result to be covertly occupied. 
    ;   It won't be at ?x ?current_y2 anymore, so it will result to be undisclosed (not covertly occupied).
    ; - If the cat is moving right, it will be at ?x ?next_y and ?x ?current_y2, which result to be covertly occupied. 
    ;   It won't be at ?x ?current_y1 anymore, so it will result to be undisclosed (not covertly occupied).

    (:action cat-up-or-down
        :parameters (?c - cat ?x - location ?current_y1 - location ?current_y2 - location ?next_y - location)
        :precondition (and
            (on ?c ?x ?current_y1)
            (on ?c ?x ?current_y2)
            (not (full ?x ?next_y))
            (not (= ?current_y1 ?current_y2))
            (move ?current_y2 ?current_y1)
            (or (move ?current_y1 ?next_y) (move ?next_y ?current_y2))
        )
        :effect (and
            (when
                (and (move ?current_y1 ?next_y)) ; The cat will move to the left
                (and
                    (on ?c ?x ?next_y)
                    (on ?c ?x ?current_y1)
                    (full ?x ?next_y)
                    (not (on ?c ?x ?current_y2))
                    (not (full ?x ?current_y2))
                )
            )

            (when
                (and (move ?next_y ?current_y2)) ; The cat will move to the right
                (and
                    (on ?c ?x ?next_y)
                    (on ?c ?x ?current_y2)
                    (full ?x ?next_y)
                    (not (on ?c ?x ?current_y1))
                    (not (full ?x ?current_y1))
                )
            )

        )
    )
   
)
