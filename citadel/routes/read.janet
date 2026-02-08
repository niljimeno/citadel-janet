(import "../db")

(defn route
  [req path]
  (let [key (get-in req [:query "name"])]
    (db/read key)))
