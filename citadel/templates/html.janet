(import ../db)

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

(defn search-form
  []
  [:form {:method "get"
          :action "/search"
          :accept-charset "utf-8"}
   [:input {:id "search"
            :type "text"
            :placeholder "search"
            :name "q"}]
   [:input {:type "submit"
            :value "search"}]])

(defn title-search
  []
  [:div {:class "title-search"}
   [:a {:href "/"}
    [:h1 (get db/data :title)]]
   (search-form)])
