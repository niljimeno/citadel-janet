(import "../templates/html")
(import "../db")

(defn- result-block
  [result]
  (let [key (first result)
        content (last result)]
    [:li
     [:h3 key]
     [:p content]]))

(defn- page
  [results]
  [:html {:lang "en"}
   (html/head)
   [:body
    [:h1 "Citadel"]
    html/search-form
    [:ul {:class "results"}
     ;(map result-block results)]]])

(defn route
  [req path]
  (page (db/list)))
