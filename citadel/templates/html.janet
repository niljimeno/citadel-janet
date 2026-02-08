(defn head
  [&keys {:title title}]
  (default title "Citadel")
  [:head
   [:link {:rel "stylesheet"
           :href "style.css"}]
   [:title title]])

(def search-form
  [:form
   [:input {:type "text"}]
   [:input {:type "submit"}]])
