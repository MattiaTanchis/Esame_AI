(define (problem problem6x6) (:domain TommyVsGerry)

    ; -------------------------
    ; |   |   |   |   | c | 2 |
    ; | g |   |   |   |   |   |
    ; |   |   |   |   |   |   |
    ; | c | 5 |   |   | c | 3 |
    ; |   | c |   |   | c |   |
    ; | xx| 4 |   |   | 1 | x |
    ; -------------------------


(:objects
	gerry - rat
	cat1 cat2 cat3 cat4 cat5 - cat
	x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 - location  
)

(:init 
	(on gerry x1 y2)

	(on cat1 x5 y5)
	(on cat1 x5 y6)
	
    (on cat2 x5 y1)
	(on cat2 x6 y1)
  
    (on cat3 x5 y4)
    (on cat3 x6 y4)

    (on cat4 x2 y5)
    (on cat4 x2 y6)

    (on cat5 x1 y4)
    (on cat5 x2 y4)


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
	
    (full x5 y5)
	(full x5 y6)
	
    (full x5 y1)
	(full x6 y1)

    (full x5 y4)
    (full x6 y4)

    (full x2 y5)
    (full x2 y6)

    (full x1 y4)
    (full x2 y4)

)
(:goal (and
    (visited gerry x6 y6)
    (on gerry x1 y6)
  )
  )
)