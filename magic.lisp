(in-package :cypress)

;;; Actions

(defthing spell reagents)

(defmethod use ((caster thing) (spell spell))
  (with-fields (reagents) spell
    (when (have-reagents caster reagents)
      (expend-reagents caster reagents)
      (cast caster spell))))

(defmethod cast ((caster thing) (spell spell)))

(defmethod can-pick ((spell spell)) nil)

(defthing (spark spell)
  :description "Spark: light a fire"
  :reagents '(:magic 2)
  :image "spark.png")

(defmethod cast ((caster thing) (spell spark))
  (message "Nothing happens."))

(defthing (cure spell)
  :description "Cure light wounds"
  :reagents '(:magic 25 ginseng 1)
  :image "fancy-heart.png")

(defmethod cast ((caster thing) (spell cure))
  (modify-fatigue caster -1)
  (modify-health caster (random-choose '(15 20 20 25))))
      
(defthing (craft-wooden-arrows spell)
  :description "Craft wooden arrows"
  :reagents '(:magic 2 wood 2 stone 1)
  :image "craft-arrows.png")
  
(defmethod cast ((caster thing) (spell craft-wooden-arrows))
  (add-inventory-item caster (quantity-of 'wooden-arrow 10)))



