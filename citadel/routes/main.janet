(import "../templates/html")

(defn route
  {:path "/"}
  [req path]
  [:html {:lang "en"}
   html/head
   [:body
    [:h1 "Citadel"]
    html/search-form]])
