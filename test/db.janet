(use ../citadel/db)

(print (string/find "aa" "aa"))
(print (string/find "aa" "aaaa"))
(print (string/find "aaaa" "aa"))
(print (if (string/find "aa" "aa") "truth" "lies"))
