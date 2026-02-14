(import "../db")

(defn route
  [req path]
  (let [query (get req :query)]
    (db/add {:name (query "name")
             :url (query "url")
             :description (query "description")
             :tags (query "tags")})))
