(import "../templates/html")

(defn- page
  []
  [:html {:lang "en"}
   (html/head)
   [:body
    html/title
    html/search-form]])

(defn route
  [req path]
  (page))
