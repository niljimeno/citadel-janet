(import citadel-native)

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

(defn list
  []
  (->> (citadel-native/search)
       (partition 2)
       (map get-tags)))

(defn setup
  []
  (citadel-native/setup))
