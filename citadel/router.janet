(import spork/httpf)
(import "./templates/style")
(import "./templates/html")
(import "./routes/main")

(defn style
  "Style route"
  {:path "/style.css"
   :render-mime "text/css"}
  [&]
  style/css)

(defn add-route
  [server route fun &opt mime]
  (httpf/add-route server route "" nil fun
                   ;(if mime [nil mime] [])))

(defn start
  []
  (-> (httpf/server)
      (add-route "/" main/route)
      (add-route "/style.css" style "text/css")
      (httpf/listen "0.0.0.0" "8080")))
