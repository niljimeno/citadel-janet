(import janet-css/css)

(def- global-settings
  [[:ul
   [:padding 0]]
  [:img
   [:image-rendering "pixelated"]]])

(def- colors
  (let [bg "#0c0810"
        fg-comment "#aaaaaa"
        fg-color "#e0a0ff"
        fg-name "#ffff88"
        fg-url "#22aa22"
        fg "white"]
    [[:body
      [:background-color bg]
      [:color fg]]
     [:h1
      [:color fg-color]]
     [:.title
      [:margin-top "5em"]]
     [".results, .results tr, .results td"
      [:border-color fg-color]]
     [:.results
      [:.name
       [:color fg-name]]
      [:.url
       [:color fg-url]]
      # [:.description
      #  [:color fg-comment]]
      ]]))

(def- title
  [:.title
   [:h1
    [:font-size "4em"]
    [:text-align "center"]]])

(def- form
  [:form
   [:width "fit-content"]
   [:margin "0 auto"]

   [:input
    [:display "inline-block"]]
   ["input:focus"
    [:outline "0"]]
   ["input[type=text]"
    [:width "20em"]
    [:margin-right "0.4em"]]])

(def- title-search
  [:.title-search
   [:display "flex"]
   [:flex-wrap "nowrap"]
   [:gap "2em"]

   [:form
    [:align-content "center"]
    [:margin "0"]]

   [:h1
    [:margin "0.4em"]]])

(def- results
  [:.results
   [:width "600px"]
   [:max-width "90%"]

   [:.result
    [:margin "1em 3em"]]

   [:.name
    [:margin-bottom "0.2em"]
    [:font-size "1.3em"]
    [:font-weight "semibold"]
    [:text-decoration "none"]]

   [:td
    [:padding "0.2em"]]

   ["tr, .results td"
    [:border-width "1px"]
    [:border-style "solid"]
    # [:border-collapse "collapse"]
    ]

   [:p
    [:margin "0em 0"]]])

# [:li
#     [:display "block"]
#     [:border "1px solid black"]
#     [:padding "0 1em"]
#     [:max-width "800px"]]

(def css
  "CSS content"
  (css/into-css
   ;global-settings
   ;colors
   title
   title-search
   form
   results))
