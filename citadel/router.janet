(import spork/httpf)
(import "./templates/style")
(import "./templates/html")
(import "./routes/search" :as route-search)
(import "./routes/index" :as route-index)

(defn style
  "Style route"
  {:path "/style.css"
   :render-mime "text/css"}
  [&]
  (style/css))

(defn add-route
  [server route fun &keys {:mime mime}]
  (httpf/add-route server route "" nil fun
                   ;(if mime [nil mime] [])))

(defn- asset
  [src &]
  (slurp (string "assets/" src)))

(def resources
  {"citadel.png" (asset "citadel.png")
   "showall.webp" (asset "showall.webp")
   "search.svg" (asset "search.svg")
   "banner.png" (asset "banner.png")
   "vim.js" (slurp "js/vim.js")})


(defn add-file
  [server name mime]
  (print (string "/" name))
  (print (string "assets/" name))
  (add-route server
             (string "/" name)
             (fn [_ &] (get resources name))
             :mime mime))

(defn start
  []
  (-> (httpf/server)
      (add-route "/" route-index/route)
      (add-route "/search" route-search/route)
      (add-route "/style.css" style :mime "text/css")
      (add-route "/vim.js"
                 (fn [_ &] (get resources "vim.js"))
                 :mime "application/javascript")
      (add-file "banner.png" "image/png")
      (add-file "citadel.png" "image/png")
      (add-file "showall.webp" "image/webp")
      (add-file "search.svg" "image/svg+xml")
      (httpf/listen "0.0.0.0" "8080")))
