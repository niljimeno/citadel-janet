(declare-project
  :name "hey"
  :description ``` ```
  :version "0.0.0")

(declare-native
  :name "hey-native"
  :source @["c/module.c"]
  :cflags ["-D_POSIX_C_SOURCE=200809L"]
  :lflags ["-lgdbm"])

(declare-executable
  :name "hey"
  :entry "hey/init.janet"
  :deps ["build/hey-native.so"
         "build/hey-native.a"])
