(define (problem 4x4) (:domain TommyVsGerry)

    ; -----------------
    ; |   |   |   |   |
    ; |   | XX|   |   |
    ; |   |   | 1 |   |
    ; | g |   | c | x |
    ; -----------------

    (:objects
        gerry - rat
        cat1  - cat
        x1 y1 x2 y2 x3 y3 x4 y4 - location    )
    
    (:init
        (on gerry x4 y1)

        (on cat1 x3 y3)
        (on cat1 x3 y4)

     
        (move y2 y1)
        (move y3 y2)
        (move y4 y3)

        (move x2 x1)
        (move x3 x2)
        (move x4 x3)
        

        (full x1 y4)
        (full x3 y3)
        (full x3 y4)
    
        
    )

   (:goal (and
    (visited gerry x4 y4)
    (on gerry x2 y2)
   )
   )
)