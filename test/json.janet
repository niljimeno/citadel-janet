(import spork/json)

(let [res (json/decode `{"name": "pernil"}`)]
  (print res)
  (print (get res "name")))
