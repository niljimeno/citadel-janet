(import "../templates/html")
(import "../db")

(defn- result-block
  [result]
  [:tr
   [:td (get result :name)]
   [:td (get result :url)]
   [:td (get result :description)]
   [:td (-> (get result :tags)
            (string/join ", "))]])

(defn- page
  [results]
  [:html {:lang "en"}
   (html/head)
   [:body
    html/title
    html/search-form
    [:table {:class "results"}
     ;(map result-block results)]]])

(defn route
  [req path]
  (page (db/list)))
