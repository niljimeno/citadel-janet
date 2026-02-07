(import janet-css/css)

(def css
  "CSS content"
  (css/into-css
   [:h1
    [:color "purple"]]))
