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
        bg-alt (get db/theme :bg-alt)
        fg (get db/theme :fg)
        fg-comment (get db/theme :fg-comment)
        fg-comment-b (get db/theme :fg-comment-b)
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
       [:color fg-comment]
       [:text-align "center"]]
      [:.url
       [:color fg-url]]
      [:.tag
       [:background-color bg-base]
       [:border-color fg]]
      [:.result
       [:background-color bg-alt]
       [:border-color fg-comment-b]]
      [".result:hover"
       [:background-color bg]]
      [".result.focused"
       [:background-color bg]]]

     [:form
      [:align-content "center"]
      [:margin "0"]
      [:margin-bottom "2em"]

      [:input
       [:background-color bg-base]
       [:color fg]
       [:border-top-color fg-comment-b]
       [:border-left-color fg-comment-b]
       [:border-bottom-color fg-comment]
       [:border-right-color fg-comment]]
      ["input:hover"
       [:border-top-color fg-comment]
       [:border-left-color fg-comment]
       [:border-bottom-color fg]
       [:border-right-color fg]]
      [:button
       [:background-color bg-base]
       [:color fg]
       [:border-top-color fg-comment-b]
       [:border-left-color fg-comment-b]
       [:border-bottom-color fg-comment]
       [:border-right-color fg-comment]]
      ["button:hover"
       [:border-top-color fg-comment]
       [:border-left-color fg-comment]
       [:border-bottom-color fg]
       [:border-right-color fg]
       [:cursor "pointer"]]
     [:.links
      [:.showall
       [:color fg-highlight-b]]
      [".showall:hover"
       [:text-decoration "underline"]]]]]))

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
   [:width "100%"]

   [:h1
    [:font-size "4em"]
    [:font-weight "bold"]
    [:margin-bottom "0.2em"]
    [:text-align "center"]]

   [:.search
    [:width "100%"]
    [:gap "2em"]]])

(def- subtitle
  [:.subtitle
   [:margin-top "3em"]
   [:text-align "center"]
   [:p
    [:margin "0.6em"]]])

(def- banner
  [:.banner
   [:display "block"]
   [:margin "5em auto"]])

(def- form
  [:form
   [:display "grid"]
   [:grid-template-columns "auto 60px"]
   [:width "100%"]

   [:input
    [:display "inline-block"]
    [:height "40px"]
    [:padding "0.2em"]
    [:box-sizing "border-box"]
    [:width "100%"]]
   ["input[type=text]"
    [:border-style "solid"]
    [:border-width "2px"]
    [:padding "0 1em"]
    [:font-size "1em"]]
   [:button
    [:border-style "solid"]
    [:border-width "2px"]
    [:border-radius 0]]])

(def- title-search
  [:.title-search
   [:display "flex"]
   [:flex-wrap "nowrap"]
   [:gap "2em"]

   [:h1
    [:margin "0.4em"]]])

(def- results
  [:.results
   [:width "100%"]
   [:margin-bottom "50%"]

   [:.alert
    [:padding "0 1em"]]

   [:.result
    [:display "block"]
    [:padding "1em 3em"]
    [:margin "1em 0"]
    [:border-style "solid"]
    [:border-width "2px"]]

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
    [:margin-right "0.8em"]]])

(def- main
  [:main
   [:width "700px"]
   [:max-width "100%"]
   [:margin "4em auto"]])

(defn css
  "CSS content"
  []
  (css/into-css
   ;global-settings
   ;(colors)
   links
   title
   subtitle
   banner
   main
   form
   results))
