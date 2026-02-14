(import "./db")
(import "./router")


(defn main
  [&]
  (and (db/setup)
       (router/start)))
