(import tomlin)

(var data nil)

(def- tags
  [:name :description :tags])

(defn- get-tags
  [x]
  (->> (last x)
       (string/split ";")
       (zipcoll tags)
       (|(-> $
             (put :url (first x))
             (put :tags (string/split "," (get $ :tags)))))))

(defn- compare
  [pattern item]
  (default pattern "")
  (default item "")
  (any? (map (fn [lookup]
          (string/find
           ;(map string/ascii-lower
                 [pattern (get item lookup)])))
          [:name :url])))

(defn search
  [pattern]
  (default pattern "")
  (let [items (get data :items)]
    (if (and pattern (-> pattern empty? not))
      (filter (partial compare pattern) items)
      items))
    )

(defn load
  [toml]
  (-> (slurp toml)
      (tomlin/toml->janet)
      (->> (set data)))
  (map |(print (get $ :name)) (get data :items))
  1)

(defn setup
  []
  (load "data.toml"))
