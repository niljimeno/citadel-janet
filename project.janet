(declare-project
  :name "citadel"
  :description ``` ```
  :version "0.0.0"
  :dependencies ["https://github.com/janet-lang/spork"
                 "https://github.com/swlkr/janet-html"
                 "https://github.com/niljimeno/janet-css"
                 "https://github.com/pyrmont/tomlin"])

(declare-executable
  :name "citadel"
  :entry "citadel/init.janet")
