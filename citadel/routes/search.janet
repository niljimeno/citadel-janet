(import "../templates/html")
(import "../db")

(defn- result-block
  [result]
  [:div {:class "result"}
   [:a {:class "name"
        :href (get result :url)}
    (get result :name)]
   [:p {:class "url"} (get result :url)]
   [:p {:class "description"} (get result :description)]
   # [:span {:class "tags"} (-> (get result :tags)
   #                        (string/join ", "))]
   ])

(defn- page
  [results]
  [:html {:lang "en"}
   (html/head)
   [:body
    [:main
     html/title-search
     [:div {:class "results"}
      ;(map result-block results)]]]])

(defn route
  [req path]
  (page (db/list)))
