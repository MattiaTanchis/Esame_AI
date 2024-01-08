(define (problem problem6x6) (:domain TommyVsGerry)

 ;    -------------------------
    ;X| c | 1 |   |   |   |   |
    ; | g | c | 2 |   |   |   |
    ; | c | 3 | c |   |   |   |
    ; |   |   | 4 |   |   | X |
    ; |   |   | c | 5 |   |   |
    ; |   |   |   |   |   |   |
    ; -------------------------

(:objects
        gerry - rat
        cat1 cat2 cat3 cat4 cat5 - cat
        x1 y1 x2 y2 x3 y3 x4 y4 x5 y5 x6 y6 - location    )

(:init
    (on gerry x1 y2)

    (on cat1 x1 y1)
    (on cat1 x2 y1)

    (on cat2 x2 y2)
    (on cat2 x3 y2)

    (on cat3 x1 y3)
    (on cat3 x2 y3)

    (on cat4 x3 y3)
    (on cat4 x3 y4)

    (on cat5 x3 y5)
    (on cat5 x4 y5)

   
    (move y2 y1)
    (move y3 y2)
    (move y4 y3)
    (move y5 y4)
    (move y6 y5)

    (move x2 x1)
    (move x3 x2)
    (move x4 x3)
    (move x5 x4)
    (move x6 x5)

    (full x1 y2)
    
    (full x1 y1)
    (full x2 y1)

    (full x2 y2)
    (full x3 y2)

    (full x1 y3)
    (full x2 y3)

    (full x3 y3)
    (full x3 y4)

    (full x3 y5)
    (full x4 y5)


)

(:goal (and
    (visited gerry x6 y4)
    (on gerry x1 y1)

)


)


)