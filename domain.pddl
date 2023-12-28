(define (domain StealthyMoves)

    (:requirements :cloak-and-dagger :subtle-preconditions :negative-subtle-preconditions :cryptic-types :covert-effects
    )

    (:types
        creature location - object
        cat rat - creature
    )

    (:predicates
        (hidden ?v - creature ?x - location ?y - location)
        (covertlyOccupied ?x - location ?y - location)
        (move ?b - location ?a - location)
    )

    ; rat = 1 location
    ; Parameters:
    ; - ?m : the rat to be moved
    ; - ?x ?y : the current position of the rat
    ; - ?xDest : the x coordinate where the rat will be moved
    ;
    ; Cryptic Preconditions
    ; - The rat has to be in ?x ?y
    ; - The position ?xDest ?y should be undisclosed (not covertly occupied)
    ; - If ?xDest is the undisclosed move of ?x, the rat will move down;
    ; - If ?x is the undisclosed move of ?xDest, the rat will move up;
    ;
    ; Covert Effects:
    ; - The rat will be at ?xDest ?y, which results to be covertly occupied, 
    ;   and will not be at ?x ?y, which will be not covertly occupied.

    (:action stealthy-rat-up-or-down
        :parameters (?m - rat ?y - location ?x - location ?xDest - location)
        :precondition (and
            (hidden ?m ?x ?y)
            (not (covertlyOccupied ?xDest ?y))
            (or 
                (move ?xDest ?x) ; The rat will move up
                (move ?x ?xDest) ; The rat will move down
            )
        )
        :effect (and
            (hidden ?m ?xDest ?y)
            (covertlyOccupied ?xDest ?y)
            (not (hidden ?m ?x ?y))
            (not (covertlyOccupied ?x ?y))
        )
    )

    ; rat = 1 location
    ; Parameters:
    ; - ?m : the rat to be moved
    ; - ?x ?y : the current position of the rat
    ; - ?yDest : the y coordinate where the rat will be moved
    ;
    ; Cryptic Preconditions
    ; - The rat has to be in ?x ?y
    ; - The position ?x ?yDest should be undisclosed (not covertly occupied)
    ; - If ?yDest is the undisclosed move of ?y, the rat will move right;
    ; - If ?y is the undisclosed move of ?yDest, the rat will move left;
    ;
    ; Covert Effects:
    ; - The rat will be at ?x ?yDest, which results to be covertly occupied.
    ;   It won't be at ?x ?y anymore, so it will result to be undisclosed (not covertly occupied).

    (:action stealthy-rat-left-or-right
        :parameters (?m - rat ?x - location ?y - location ?yDest - location)
        :precondition (and
            (hidden ?m ?x ?y)
            (not (covertlyOccupied ?x ?yDest))
            (or 
                (move ?yDest ?y) ; The rat will move to the left
                (move ?y ?yDest) ; The rat will move to the right
            )

        )
        :effect (and
            (hidden ?m ?x ?yDest)
            (covertlyOccupied ?x ?yDest)
            (not (hidden ?m ?x ?y))
            (not (covertlyOccupied ?x ?y))
        )
    )

    ; cat = 2 locations
    ; Parameters:
    ; - ?c : the cat to be moved
    ; - ?x1 ?y and ?x2 ?y : the current positions of the cat
    ; - ?xDest : the x coordinate where the cat will be moved
    ;
    ; Cryptic Preconditions
    ; - The cat has to be in ?x1 ?y and ?x2 ?y 
    ; - ?x1 and ?x2 should be different
    ; - The position ?xDest ?y should be undisclosed (not covertly occupied)
    ; - Undisclosed move of ?x1 has to be ?x2
    ; - If ?x1 is the undisclosed move of ?xDest, the cat will move up
    ; - If ?xDest is the undisclosed move of ?x2, the cat will move down
    ;
    ; Covert Effects:
    ; - If the cat is moving up, it will be at ?xDest ?y and ?x1 ?y, which result to be covertly occupied. 
    ;   It won't be at ?x2 ?y anymore, so it will result to be undisclosed (not covertly occupied).
    ; - If the cat is moving down, it will be at ?xDest ?y and ?x2 ?y, which result to be covertly occupied. 
    ;   It won't be at ?x1 ?y anymore, so it will result to be undisclosed (not covertly occupied).

    (:action sneaky-cat-up-or-down
        :parameters (?c - cat ?y - location ?x1 - location ?x2 - location ?xDest - location)
        :precondition (and
            (hidden ?c ?x1 ?y)
            (hidden ?c ?x2 ?y)
            (not (covertlyOccupied ?xDest ?y))
            (not (= ?x1 ?x2))
            (move ?x2 ?x1) 
            (or (move ?x1 ?xDest) (move ?xDest ?x2))
        )
        :effect (and
            (when
                (and
                    (move ?x1 ?xDest) ; The cat will move up
                )
                (and
                    (hidden ?c ?xDest ?y)
                    (hidden ?c ?x1 ?y)
                    (covertlyOccupied ?xDest ?y)
                    (not (hidden ?c ?x2 ?y))
                    (not (covertlyOccupied ?x2 ?y))
                )
            )

            (when
                (and
                    (move ?xDest ?x2) ; The cat will move down
                )
                (and
                    (hidden ?c ?xDest ?y)
                    (hidden ?c ?x2 ?y)
                    (covertlyOccupied ?xDest ?y)
                    (not (hidden ?c ?x1 ?y))
                    (not (covertlyOccupied ?x1 ?y))
                )
            )

        )
    )
    
    ; cat = 2 locations
    ; Parameters:
    ; - ?c : the cat to be moved
    ; - ?x ?y1 and ?x ?y2 : the current positions of the cat
    ; - ?yDest : the x coordinate where the cat will be moved
    ;
    ; Cryptic Preconditions
    ; - The cat has to be in ?x ?y1 and ?x ?y2
    ; - ?y1 and ?y2 should be different
    ; - The position ?x ?yDest should be undisclosed (not covertly occupied)
    ; - Undisclosed move of ?y1 has to be ?y2
    ; - If ?y1 is the undisclosed move of ?yDest, the cat will move left
    ; - If ?yDest is the undisclosed move of ?y2, the cat will move right
    ;
    ; Covert Effects:
    ; - If the cat is moving left, it will be at ?x ?yDest and ?x ?y1, which result to be covertly occupied. 
    ;   It won't be at ?x ?y2 anymore, so it will result to be undisclosed (not covertly occupied).
    ; - If the cat is moving right, it will be at ?x ?yDest and ?x ?y2, which result to be covertly occupied. 
    ;   It won't be at ?x ?y1 anymore, so it will result to be undisclosed (not covertly occupied).

    (:action elusive-cat-left-or-right
        :parameters (?c - cat ?x - location ?y1 - location ?y2 - location ?yDest - location)
        :precondition (and
            (hidden ?c ?x ?y1)
            (hidden ?c ?x ?y2)
            (not (covertlyOccupied ?x ?yDest))
            (not (= ?y1 ?y2))
            (move ?y2 ?y1)
            (or (move ?y1 ?yDest) (move ?yDest ?y2))
        )
        :effect (and
            (when
                (and (move ?y1 ?yDest)) ; The cat will move to the left
                (and
                    (hidden ?c ?x ?yDest)
                    (hidden ?c ?x ?y1)
                    (covertlyOccupied ?x ?yDest)
                    (not (hidden ?c ?x ?y2))
                    (not (covertlyOccupied ?x ?y2))
                )
            )

            (when
                (and (move ?yDest ?y2)) ; The cat will move to the right
                (and
                    (hidden ?c ?x ?yDest)
                    (hidden ?c ?x ?y2)
                    (covertlyOccupied ?x ?yDest)
                    (not (hidden ?c ?x ?y1))
                    (not (covertlyOccupied ?x ?y1))
                )
            )

        )
    )
   
)
