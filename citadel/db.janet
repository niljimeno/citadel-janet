(import citadel-native)

(defn add
  [key content]
  (citadel-native/add-element key content))

(defn read
  [key]
  (citadel-native/read-element key))

(defn list
  []
  (partition 2 (citadel-native/search)))

(defn setup
  []
  (citadel-native/setup))
