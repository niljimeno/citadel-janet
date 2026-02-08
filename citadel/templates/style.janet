(import janet-css/css)

(def- global-settings
  [[:ul
   [:padding 0]]
  [:img
   [:image-rendering "pixelated"]]])

(def- colors
  (let [bg "#08040a"
        fg-color "#e0a0ff"
        fg "white"]
    [[:body
      [:background-color bg]
      [:color fg]]
     [:.title
      [:background-color "black"]
      [:border-color fg-color]]]))

(def- title
  [:.title
   [:display "flex"]
   [:justify-content "space-between"]

   [:width "360px"]
   [:padding "0.2em 1em"]
   [:margin "4em auto"]

   [:border-width "1px"]
   [:border-style "solid"]

   [:img
    [:width "6em"]
    [:display "inline-block"]]

   [:h1
    [:font-size "3em"]
    [:margin-right "1em"]]])

(def- form
  [:form
   [:margin "0 auto"]
   [:display "flex"]
   [:justify-content "center"]])

(def css
  "CSS content"
  (css/into-css
   ;global-settings
   ;colors
   title
   form
   [:.results
    [:li
     [:display "block"]
     [:border "1px solid black"]
     [:padding "0 1em"]
     [:max-width "800px"]]]))
