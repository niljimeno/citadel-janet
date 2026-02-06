(import "./db")

(defn hello
  `Evaluates to "Hello!"`
  []
  (print (db/setup))
  (print (db/add-element "niliara.net" "cool site"))
  (print (db/read-element "niliara.net")))

(defn main
  [& args]
  (hello))
