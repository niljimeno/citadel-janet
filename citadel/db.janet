(import tomlin)

(var data nil)
(var theme nil)
(var tags nil)

(defn- load-tags
  []
  (->> (get data :sites)
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
  [pattern site tagsearch]
  (default pattern "")

  (any?
   (if tagsearch
     (map (fn [tag]
            (string/find
             ;(map string/ascii-lower
                   [pattern tag])))
          (or (get site :tags) []))
     (map (fn [value]
            (string/find
             ;(map string/ascii-lower
                   [pattern (get site value)])))
          [:name :url]))))

(defn search
  [pattern tagsearch]
  (default pattern "")
  (print pattern "and" tagsearch ".")
  (let [sites (get data :sites)]
    (->> (if (and pattern (-> pattern empty? not))
           (filter |(compare pattern $ tagsearch) sites)
           sites))))

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
