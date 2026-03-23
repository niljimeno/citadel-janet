(import janet-css/css)
(import ../db)

(def palette :light)

(def- global-settings
  [[:ul
   [:padding 0]]
  [:img
   [:image-rendering "pixelated"]]])

(defn- colors
  []
  (let [bg (get db/theme :bg)
        bg-base (get db/theme :bg-base)
        fg (get db/theme :fg)
        fg-comment (get db/theme :fg-comment)
        fg-colored (get db/theme :fg-colored)
        fg-highlight (get db/theme :fg-highlight)
        fg-highlight-b (get db/theme :fg-highlight-b)
        fg-name (get db/theme :fg-name)
        fg-url (get db/theme :fg-url)]
    [[:body
      [:background-color bg]
      [:color fg]]
     ["a:focus, button:focus, input:focus"
      [:outline "0 !important"]]
     [:a
      [:color fg-colored]
      [:transition-property "color"]
      [:transition-duration "0.2s"]
      [:text-decoration "none"]]
     ["a:hover, a:focus"
      [:color fg-highlight]
      [:text-decoration "underline"]]
     [".results, .results tr, .results td"
      [:border-color fg-colored]]

     [:.results
      [:color fg]
      [:.alert
       [:color fg-comment]]
      [:.url
       [:color fg-url]]
      [:.tag
       [:background-color bg-base]
       [:border-color fg]]
      [".result.focused"
       [:background-color bg-base]
       [:.tag
        [:background-color bg]]]]

     [:form
      [:input
       [:background-color bg-base]
       [:color fg]]]
     [:.links
      [:.showall
       [:color fg-highlight-b]]
      [".showall:hover"
       [:text-decoration "underline"]]]]))

(def- links
  (let [links-height "2em"]
    [:.links
     [:margin "1em"]
     [:display "flex"]
     [:justify-content "center"]
     [:flex-wrap "wrap"]

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
   [:display "flex"]
   [:justify-content "center"]

   [:a
    [:font-size "4em"]
    [:text-align "center"]
    [:font-weight "bold"]]

   [:margin "3em auto"]
   [:margin-bottom "1em"]])

(def- subtitle
  [:.subtitle
   [:margin-top "3em"]
   [:text-align "center"]
   [:p
    [:margin "0.6em"]]])

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
   [:width "700px"]
   [:max-width "90%"]

   [:.alert
    [:padding "0 3em"]]

   [:.result
    [:display "block"]
    [:padding "1em 3em"]]

   [:.name
    [:margin "0"]
    [:font-size "1.3em"]
    [:font-weight "bold"]]

   [:.url
    [:margin 0]
    [:margin-bottom "0.4em"]]

   [:.description
    [:margin "0.6em 0"]]

   [:.tag
    [:font-size "0.8em"]
    [:text-align "center"]
    [:padding "0.4em"]
    [:display "inline-block"]
    [:margin-right "0.8em"]
    [:margin-bottom "1em"]]])

(def- main
  [:main
   [:width "900px"]
   [:max-width "100%"]
   [:margin "0 auto"]])

(defn css
  "CSS content"
  []
  (css/into-css
   ;global-settings
   ;(colors)
   links
   title
   subtitle
   main
   title-search
   form
   results))
