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

(def title
  [:div {:class "title"}
   [:img {:src "citadel.png"}]
   [:h1 "Citadel"]])
