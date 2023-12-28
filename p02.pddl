(define (problem Test12x12) (:domain domainXY)

    ; -----------------
    ; |   |   |   |   |
    ; |   |   | 1 |   |
    ; |   |   | r |   |
    ; | re| d | t | x m1 |
    ; -----------------

    (:objects
        m1 - rat
        red - cat
        t1 - truck
        x1 x2 x3 x4 y1 y2 y3 y4 x5 y5 x6 y6 x7 y7 x8 y8 x9 y9 x10 y10 x11 y11 x12 y12 - location
    )
    
    (:init
        (hidden m1 x4 y4)

        (hidden red x4 y1)
        (hidden red x4 y2)

        (hidden t1 x2 y3)
        (hidden t1 x3 y3)
        (hidden t1 x4 y3)

        (move x2 x1) 
        (move x3 x2)
        (move x4 x3)
        (move x5 x4)
        (move x6 x5)
        (move x7 x6)
        (move x8 x7)
        (move x9 x8)
        (move x10 x9)
        (move x11 x10)
        (move x12 x11)
        
        (move y2 y1) 
        (move y3 y2)
        (move y4 y3)
        (move y5 y4)
        (move y6 y5)
        (move y7 y6)
        (move y8 y7)
        (move y9 y8)
        (move y10 y8)
        (move y11 y10)
        (move y12 y11)

        (occupied x4 y4)
        (occupied x4 y1)
        (occupied x4 y2)
        (occupied x2 y3)
        (occupied x3 y3)
        (occupied x4 y3)
        
    )

    (:goal
        (hidden red x4 y4)
    )

)