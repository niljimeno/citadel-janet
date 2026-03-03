(import janet-css/css)

(def- global-settings
  [[:ul
   [:padding 0]]
  [:img
   [:image-rendering "pixelated"]]])

(def- colors
  (let [bg "#0c0810"
        bg-base "#000"
        fg-comment "#aaaaaa"
        fg-color "#e0a0ff"
        fg-yellow "#ffff22"
        fg-name "#ffff88"
        fg-url "#22aa22"
        fg "white"]
    [[:body
      [:background-color bg]
      [:color fg]]
     ["a:focus, button:focus, input:focus"
      [:outline "0 !important"]]
     [:a
      [:color fg-color]
      [:transition-property "color"]
      [:transition-duration "0.2s"]
      [:text-decoration "none"]]
     ["a:hover, a:focus"
      [:color fg-yellow]]
     [".results, .results tr, .results td"
      [:border-color fg-color]]
     [:.results
      [:.url
       [:color fg-url]]
      [:p
       [:color fg]]
      [:span
       [:color fg]]]
     [:form
      [:input
       [:background-color bg-base]
       [:color fg]]]
     [:.links
      [:.showall
       [:color "red"]]
      [".showall:hover"
       [:text-decoration "underline"]]]]))

(def- links
  (let [links-height "2em"]
    [:.links
     [:margin "1em"]
     [:display "flex"]
     [:justify-content "center"]

     [:.separator
      [:user-select "none"]
      [:margin "0.4em"]]

      [:span
       [:line-height links-height]
       [:padding "0 0.4em"]]

     [:.link
      [:height links-height]
      [:align-content "center"]
      [:display "inline-flex"]

      [:.inline-image
       [:display "inline-block"]
       [:img
        [:height "100%"]]]
      ]]))

(def- title
  [:.title
    [:margin-top "2em"]
   [:h1
    [:font-size "4em"]
    [:text-align "center"]]])

(def- form
  [:form
   [:width "fit-content"]
   [:margin "0 auto"]

   [:input
    [:display "inline-block"]]
   # ["input:focus"
   #  [:outline "0"]]
   ["input[type=text]"
    [:width "20em"]
    [:height "2em"]
    [:padding "0.2em"]]
   ["input[type=submit]"
    [:display "none"]]])

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
    [:display "block"]
    [:padding "1em 3em"]]

   [".result:hover"
    [:background-color "black"]]
   [".result:focus"
    [:background-color "black"]]

   [:.name
    [:margin-bottom "0.2em"]
    [:margin-top "0.2em"]
    [:font-size "1.3em"]
    [:font-weight "bold"]
    [:text-decoration "none"]]

   [:p
    [:margin "0em 0"]]])

(def- main
  [:main
   [:width "900px"]
   [:max-width "100%"]
   [:margin "0 auto"]])

(def css
  "CSS content"
  (css/into-css
   ;global-settings
   ;colors
   links
   title
   main
   title-search
   form
   results))
