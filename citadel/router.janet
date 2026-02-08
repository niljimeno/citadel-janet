(import spork/httpf)
(import "./templates/style")
(import "./templates/html")
(import "./routes/search" :as route-search)
(import "./routes/main" :as route-main)
(import "./routes/read" :as route-read)
(import "./routes/add" :as route-add)

(defn style
  "Style route"
  {:path "/style.css"
   :render-mime "text/css"}
  [&]
  style/css)

(defn add-route
  [server route fun &keys {:mime mime}]
  (httpf/add-route server route "" nil fun
                   ;(if mime [nil mime] [])))

(defn start
  []
  (-> (httpf/server)
      (add-route "/" route-main/route)
      (add-route "/add" route-add/route)
      (add-route "/read" route-read/route)
      (add-route "/search" route-search/route)
      (add-route "/style.css" style :mime "text/css")
      (httpf/listen "0.0.0.0" "8080")))
