(import "../templates/html")
(import "../db")

(defn- tag
  [t]
  [:a {:class "tag"
       :href (string "/search?tag=" t)}
   t])

(defn- result-block
  [result]
  (let [url (get result :url)
        name (get result :name)
        description (get result :description)
        tags (get result :tags)]
    [:div {:class "result"}
     [:a {:class "name"
          :href url}
       name]
     [:p {:class "url"} url]
     [:p {:class "description"} description]
     ;(map tag (or tags
                   []))
     ]))

(defn- page
  [results]
  (print "Got to results")
  [:html {:lang "en"}
   (html/head)
   [:body
    [:main
     (html/title-search)
     [:div {:class "results"}
      ;(map result-block results)]]]])

(defn route
  [req path]
  (let [tag (get-in req [:query "tag"])
        query (or tag (get-in req [:query "q"]))]
    (print tag)
    (-> query
        (db/search tag)
        page)))
