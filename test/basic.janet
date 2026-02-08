(use ../citadel/db)

(print (do (db/setup)
         (db/search)))
