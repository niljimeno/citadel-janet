(import tomlin)

(var data nil)
(var theme nil)
(var tags nil)

(defn- load-tags
  []
  (->> (get data :items)
       (map |(or (get $ :tags) []))
       (map (partial map string/ascii-lower))
       (reduce
        (fn [l x]
          @[;l
            ;(filter
              (fn [x] (not (has-value? l x)))
              x)])
        @[])
       (sort)
       (set tags)))

(defn- compare
  [pattern item tagsearch]
  (default pattern "")

  (any?
   (if tagsearch
     (map (fn [tag]
            (string/find
             ;(map string/ascii-lower
                   [pattern tag])))
          (or (get item :tags) []))
     (map (fn [value]
            (string/find
             ;(map string/ascii-lower
                   [pattern (get item value)])))
          [:name :url]))))

(defn search
  [pattern tagsearch]
  (default pattern "")
  (print pattern "and" tagsearch ".")
  (let [items (get data :items)]
    (->> (if (and pattern (-> pattern empty? not))
           (filter |(compare pattern $ tagsearch) items)
           items))))

(defn setup
  []
  (-> (slurp "config.toml")
      (tomlin/toml->janet)
      (->> (set data)))
  (-> (slurp (string "themes/" (get data :theme) ".toml"))
      (tomlin/toml->janet)
      (->> (set theme)))
  (load-tags)
  1)
