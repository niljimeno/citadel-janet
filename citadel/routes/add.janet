(import "../db")

(defn route
  [req path]
  (let [key (get-in req [:query "name"])
        content (get-in req [:query "content"])]
    (default key "nul")
    (default content "nul")
    (db/add key content)))
