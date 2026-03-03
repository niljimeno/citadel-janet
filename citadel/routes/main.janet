(import "../templates/html")

(def links
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

(def title
  [:a {:href "/"}
   [:div {:class "title"}
    [:h1 "Citadel"]]])

(defn- page
  []
  [:html {:lang "en"}
   (html/head)
   [:body
    links
    title
    html/search-form]])

(defn route
  [req path]
  (page))
