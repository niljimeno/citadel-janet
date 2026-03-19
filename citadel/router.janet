(import spork/httpf)
(import "./templates/style")
(import "./templates/html")
(import "./routes/search" :as route-search)
(import "./routes/index" :as route-index)
# (import "./routes/read" :as route-read)
# (import "./routes/add" :as route-add)

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

(defn- icon
  [src &]
  (slurp (string "assets/" src)))

(def resources
  {"citadel.png" (icon "citadel.png")
   "showall.webp" (icon "showall.webp")
   "vim.js" (slurp "js/vim.js")})


(defn add-sprite
  [server name]
  (print (string "/" name))
  (print (string "assets/" name))
  (add-route server
             (string "/" name)
             (fn [_ &] (get resources name))
             :mime "image/png"))

(defn start
  []
  (-> (httpf/server)
      (add-route "/" route-index/route)
      (add-route "/search" route-search/route)
      (add-route "/style.css" style :mime "text/css")
      (add-route "/vim.js"
                 (fn [_ &] (get resources "vim.js"))
                 :mime "application/javascript")
      (add-sprite "citadel.png")
      (add-sprite "showall.webp")
      (httpf/listen "0.0.0.0" "8080")))
