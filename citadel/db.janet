(import citadel-native)
(import tomlin)

(defn add
  [instance]
  (print (instance "url"))
  (citadel-native/add-element
   (instance :url)
   (string/join @[(string (get instance :name))
                  (string (get instance :description))
                  (string (get instance :tags))]
                ";" )))

(defn read
  [key]
  (citadel-native/read-element key))

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
  (any? (map (fn [lookup]
          (string/find
           ;(map string/ascii-lower
                 [pattern (get item lookup)])))
          [:name :url])))

(defn search
  [pattern]
  (default pattern "")
  (->> pattern
       (citadel-native/search)
       (partition 2)
       (map get-tags)))

(defn setup
  []
  (citadel-native/setup))

(defn load-toml
  [toml]
  (-> (slurp toml)
      (tomlin/toml->janet)
      (print)))
