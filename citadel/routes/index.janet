(import "../templates/html")
(import "../db")

(defn- links
  []
  [:nav {:class "links"}
   (map (fn [x]
          [:div
           [:a {:href x :class "link"}
            [:span x]]
           [:span {:class "separator"} "/"]])
        ["plan9" "unix" "philosophy" "janet"])
   [:a {:href "/search" :class "link showall"}
    [:div {:class "inline-image"}
     [:img {:src "/showall.webp"}]]
    [:span "show all"]]])

(defn- title
  []
  [:div {:class "title"}
   [:a {:href "/"} (get db/data :title)]])

(defn- page
  []
  [:html {:lang "en"}
   (html/head)
   [:body
    (links)
    (title)
    (html/search-form)]])

(defn route
  [req path]
  (page))
