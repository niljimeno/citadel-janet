(import "../templates/html")
(import "../db")

(defn- result-block
  [result]
  [:a {:class "result"
       :href (get result :url)}
   [:h3 {:class "name"}
        (get result :name)]
   [:p {:class "url"} (get result :url)]
   [:p {:class "description"} (get result :description)]
   # [:span {:class "tags"} (-> (get result :tags)
   #                        (string/join ", "))]
   ])

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
  (-> (get-in req [:query "q"])
      db/search
      page))
