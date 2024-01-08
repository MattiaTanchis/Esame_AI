(define (problem problem8x8) (:domain TommyVsGerry)

    ; ---------------------------------
    ; |   |   |   |   |   |   |   |   |
    ; |   |   |   |   |   |   |   |   |
    ; |   |   | c | c | 3 |   |   |   |
    ; |   |   | 6 | g | c |   |   |   |
    ; |   |   | c | 2 | 4 |   |   |   |
    ; |   |   |   |   |   |   |   | x |
    ; |   | c |   |   |   |   |   |   |
    ; | xx| 5 |   |   |   |   | c | 1 |
    ; ---------------------------------

(:objects
	gerry - rat
	cat1 cat2 cat3 cat4 cat5 cat6 - cat
	x1 x2 x3 x4 x5 x6 x7 x8 y1 y2 y3 y4 y5 y6 y7 y8 - location  
)

(:init 
	(on gerry x4 y4)

	(on cat1 x7 y8)
	(on cat1 x8 y8)
	
    (on cat2 x3 y5)
	(on cat2 x4 y5)
  	
    (on cat3 x4 y3)
	(on cat3 x5 y3)
	
    (on cat4 x5 y4)
	(on cat4 x5 y5)
	
    (on cat5 x2 y7)
	(on cat5 x2 y8)
	
    (on cat6 x3 y3)
	(on cat6 x3 y4)

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

	(full x4 y4)
	
    (full x7 y8)
	(full x8 y8)
	
    (full x3 y5)
	(full x4 y5)
  	
    (full x4 y3)
	(full x5 y3)
	
    (full x5 y4)
	(full x5 y5)
	
    (full x2 y7)
	(full x2 y8)
	
    (full x3 y3)
	(full x3 y4)
)

(:goal (and
    (visited gerry x8 y6)
    (on gerry x1 y8)
  )
  )

)