(import "../templates/html")
(import "../db")

(defn- links
  []
  [:nav {:class "links"}
   (map (fn [x]
          [:div
           [:a {:href (string "/search?tag=" x)
                :class "link"}
            [:span x]]
           [:span {:class "separator"} "/"]])
        db/tags)
   [:a {:href "/search" :class "link showall"}
    [:div {:class "inline-image"}
     [:img {:src "/showall.webp"}]]
    [:span "show all"]]])

(defn- title
  []
  [:div {:class "title"}
   [:a {:href "/"} (get db/data :title)]])

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
    (links)
    (title)
    (html/search-form)
    (subtitle)
    (banner)]])

(defn route
  [req path]
  (page))
