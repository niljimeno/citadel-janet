(import citadel-native)

(defn setup
  []
  (citadel-native/setup))

(defn add-element
  [key content]
  (citadel-native/add-element "niliara.net" "cool site"))

(defn read-element
  [key]
  (citadel-native/read-element "niliara.net"))
