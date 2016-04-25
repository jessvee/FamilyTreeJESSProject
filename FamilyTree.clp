;FACT TEMPLATES:
;these are given:
(deftemplate father-of (slot father) (slot child))
(deftemplate mother-of (slot mother) (slot child))
(deftemplate male (slot person))
(deftemplate female (slot person))
(deftemplate wife-of (slot wife) (slot husband))
(deftemplate husband-of (slot husband) (slot wife))

;intermediate relationships, can be useful in solving
;the problems
(deftemplate grandparent-of (slot grandparent) 
    (slot grandchild))
(deftemplate parent-of (slot parent) (slot child))
(deftemplate sibling-of (slot sibling1) (slot sibling2))

;these are for storing the results for the problem
(deftemplate uncle-of (slot uncle) (slot neice))
(deftemplate aunt-of (slot aunt) (slot neice))
(deftemplate cousin-of (slot cousin) (slot cousin))

(deftemplate brother-of (slot brother) (slot sibling))
(deftemplate sister-of (slot sister) (slot sibling))
(deftemplate grandmother-of (slot grandmother) 
    (slot grandchild))
(deftemplate grandfather-of (slot grandfather) 
    (slot grandchild))

;my family tree facts:
(deffacts my-family-tree
	(mother-of (mother Selma) (child Jess))
    (father-of (father Fred) (child Jess))
    (mother-of (mother Selma) (child Katy))
    ;(wife-of (wife Jess) (husband Adam))
    ;(husband-of (husband Adam) (wife Jess))
    (wife-of (wife Selma) (husband Fred))
    (husband-of (husband Fred) (wife Selma))
    ;(male (person Adam))
    (male (person Fred))
    (female (person Selma))
    (female (person Jess))
)
(reset)
(facts)

(defrule is-parent-of
    (or(father-of (father ?p) (child ?c))
       (mother-of (mother ?p) (child ?c))
    )
     =>
    (assert (parent-of (parent ?p) (child ?c)))
)
(defrule is-sibling-of
    (parent-of (parent ?p) (child ?c1))
    (parent-of (parent ?p) (child ?c2))
    =>
    (assert (sibling-of (sibling1 ?c1) (sibling2 ?c2)))
)

(run)
(facts)

