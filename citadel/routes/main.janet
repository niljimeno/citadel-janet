(import "../templates/html")

(defn- page
  []
  [:html {:lang "en"}
   (html/head)
   [:body
    [:h1 "Citadel"]
    html/search-form]])

(defn route
  [req path]
  (page))
