(define (problem MissionariesCannibals-Problem)

    (:domain MissionariesCannibals)

    (:objects
        m1 m2 m3 m4 - missionary
        c1 c2 c3 c4 - cannibal
        left right - position
    )

    (:init
        (on m1 left left) (on m2 left left) (on m3 left left) (on m4 left left)
        (on c1 left left) (on c2 left left) (on c3 left left) (on c4 left left)
        (occupied left left)
        (next right left)
    )

    (:goal
        (and
            (on m1 right right) (on m2 right right) (on m3 right right) (on m4 right right)
            (on c1 right right) (on c2 right right) (on c3 right right) (on c4 right right)
            (occupied right right)
        )
    )
)
