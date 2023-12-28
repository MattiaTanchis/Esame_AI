(define (problem Test20x) (:domain RatVSCat)

    ; -----------------
    ; |   |   |   |   |
    ; |   |   |   |   |
    ; |   |   | d |   |
    ; | m |   |re | x |
    ; -----------------

    (:objects
        gerry - rat
        cat1 - cat
        x1 y1 x2 y2 x3 y3 x4 y4 x5 y5 x6 y6 x7 y7 x8 y8 x9 y9 x10 y10 x11 y11 x12 y12 x13 y13 x14 y14 x15 y15 x16 y16 x17 y17 x18 y18 x19 y19 x20 y20 - location    )
    
    (:init
        (hidden gerry x4 y1)

        (hidden cat1 x3 y3)
        (hidden cat1 x4 y3)


        (move y2 y1)
        (move y3 y2)
        (move y4 y3)
        (move y5 y4)
        (move y6 y5)
        (move y7 y6)
        (move y8 y7)
        (move y9 y8)
        (move y10 y9)
        (move y11 y10)
        (move y12 y11)
        (move y13 y12)
        (move y14 y13)
        (move y15 y14)
        (move y16 y15)
        (move y17 y16)
        (move y18 y17)
        (move y19 y18)
        (move y20 y19)
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
        (move x13 x12)
        (move x14 x13)
        (move x15 x14)
        (move x16 x15)
        (move x17 x16)
        (move x18 x17)
        (move x19 x18)
        (move x20 x19)

        (covertlyOccupied x4 y1)
        (covertlyOccupied x3 y3)
        (covertlyOccupied x4 y3)
        
    )

    (:goal
        (hidden gerry x4 y4)
    )

)