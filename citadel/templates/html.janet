(defn head
  [&keys {:title title}]
  (default title "Citadel")
  [:head
   [:link {:rel "stylesheet"
           :href "style.css"}]
   [:link {:rel "icon"
           :href "./citadel.png"}]
   [:title title]])

(def search-form
  [:form {:method "get"
          :action "/search"}
   [:input {:type "text"
            :name "q"}]
   [:input {:type "submit"
            :value "search"}]])

(def title-search
  [:div {:class "title-search"}
   [:a {:href "/"}
    [:h1 "Citadel"]]
   search-form])

(def title
  [:a {:href "/"}
   [:div {:class "title"}
    [:h1 "Citadel"]]])
