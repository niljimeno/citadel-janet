(import hey-native)

(defn hello
  `Evaluates to "Hello!"`
  []
  (hey-native/hello-native)
  (print (hey-native/setup))
  (print (hey-native/add-element "niliara.net" "cool site"))
  (print (hey-native/read-element "niliara.net")))

(defn main
  [& args]
  (print (hello)))
