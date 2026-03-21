(import tomlin)

(var data nil)
(var theme nil)

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

(defn setup
  []
  (-> (slurp "config.toml")
      (tomlin/toml->janet)
      (->> (set data)))
  (-> (slurp (string "themes/" (get data :theme) ".toml"))
      (tomlin/toml->janet)
      (->> (set theme)))
  1)
