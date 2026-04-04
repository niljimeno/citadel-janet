(import "../templates/html")
(import "../db")

(defn- title
  []
  [:div {:class "title"}
   [:a {:href "/"} [:h1 (get db/data :title)]]])

(defn- subtitle
  []
  (let [description (get db/data :description)
        source (get db/data :source)]
    [:div {:class "subtitle"}
     [:p description]
     (and source [:b [:a {:href (get db/data :source)} "source"]])]))

(defn- banner
  []
  [:a {:href "https://citadel.niliara.net"}
   [:img {:class "banner"
          :src "/banner.png"}]])


(defn- page
  []
  [:html {:lang "en"}
   (html/head)
   [:body
    (html/links)
    [:main
     (html/title)
     (subtitle)
     # (banner)
     ]]])

(defn route
  [req path]
  (page))
