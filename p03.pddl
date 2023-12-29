(define (problem problem8x8) (:domain StealthyMoves)

    ; -----------------------------------
    ;     1   2   3   4   5   6   7   8
    ; 1 |   |   |   |   |   |   |   |   |
    ; 2 |   |   |   |   |   |   |   |   |
    ; 3 |   |   |   | c |   |   |   | X |
    ; 4 |   |   |   | 2 |   |   |   |   |
    ; 5 |   |   |   | c | 3 |   |   |   |
    ; 6 |   |   | c | 4 |   |   |   |   |
    ; 7 |   | g |   | c |   |   |   |   |
    ; 8 |   |   |   | 1 |   |   |   |   |
    ; ------------------------------------

    (:objects
        gerry - rat
        cat1 cat2 cat3 cat4 - cat
        x1 x2 x3 x4 x5 x6 x7 x8 y1 y2 y3 y4 y5 y6 y7 y8  - location
    )
    
    (:init
        (move x2 x1) 
        (move x3 x2)
        (move x4 x3)
        (move x5 x4)
        (move x6 x5)
        (move x7 x6)
        (move x8 x7)
        
        (move y2 y1) 
        (move y3 y2)
        (move y4 y3)
        (move y5 y4)
        (move y6 y5)
        (move y7 y6)
        (move y8 y7)
        
        (hidden gerry x7 y2)


        (hidden cat1 x7 y4)
        (hidden cat1 x8 y4)
        
        (hidden cat2 x3 y4)
        (hidden cat2 x4 y4)

        (hidden cat3 x5 y4)
        (hidden cat3 x5 y5)
        
        (hidden cat4 x6 y3)
        (hidden cat4 x6 y4)
    
        
        (full x7 y2)
        (full x7 y4)
        (full x8 y4)      
        (full x3 y4)
        (full x4 y4)     
        (full x5 y4)
        (full x5 y5)    
        (full x6 y3)
        (full x6 y4)
          
        
        
    )

    (:goal
        (hidden gerry x3 y8)

    )

)