(defn head
  [&keys {:title title}]
  (default title "Citadel")
  [:head
   [:link {:rel "stylesheet"
           :href "style.css"}]
   [:link {:rel "icon"
           :href "./citadel.png"}]
   [:script {:src "/vim.js"}]
   [:title title]])

(def search-form
  [:form {:method "get"
          :action "/search"
          :accept-charset "utf-8"}
   [:input {:type "text"
            :name "q"}]
   [:input {:type "submit"
            :value "search"}]])

(def title-search
  [:div {:class "title-search"}
   [:a {:href "/"}
    [:h1 "Citadel"]]
   search-form])
