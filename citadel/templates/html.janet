(import ../db)

(defn head
  [&keys {:title title}]
  (default title "Citadel")
  [:head
   [:link {:rel "stylesheet"
           :href "style.css"}]
   [:link {:rel "icon"
           :href "/citadel.png"}]
   [:script {:src "/vim.js"}]
   [:meta {:name "viewport"
           :content "width=device-width,initial-scale=1"}]
   [:title title]])

(def lens
  [:svg {:fill "none"
         :viewBox "0 0 16 16"
         :xmlns `xmlns="http://www.w3.org/2000/svg`
         :width 16
         :height 16
         :color "currentColor"}
   [:path {:fill "currentColor"
           :fill-rule "evenodd"
           :d "M7 0a7 7 0 1 0 4.488 12.372l3.445 3.445a.625.625 0 1 0 .884-.884l-3.445-3.445A7 7 0 0 0 7 0M1.25 7a5.75 5.75 0 1 1 11.5 0 5.75 5.75 0 0 1-11.5 0"
           :clip-rule "evenodd"}]])

(defn search-form
  [&opt query]
  [:form {:method "get"
          :action "/search"
          :accept-charset "utf-8"}
   [:input {:id "search"
            :type "text"
            :placeholder "search"
            :value query
            :name "q"}]
   [:button {:type "submit"}
    lens]
   ])

(defn links
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

(defn title
  []
  [:div {:class "title"}
   [:a {:href "/"} [:h1 (get db/data :title)]]
   (search-form)])


(defn title-search
  [query]
  [:div {:class "title-search"}
   [:a {:href "/"}
    [:h1 (get db/data :title)]]
   (search-form query)])
