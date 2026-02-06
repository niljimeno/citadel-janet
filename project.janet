(declare-project
  :name "citadel"
  :description ``` ```
  :version "0.0.0")

(declare-native
  :name "citadel-native"
  :source @["c/module.c"]
  :cflags ["-D_POSIX_C_SOURCE=200809L"
           "-D_GNU_SOURCE"]
  :lflags ["-lgdbm"])

(declare-executable
  :name "citadel"
  :entry "citadel/init.janet"
  :deps ["build/citadel-native.so"
         "build/citadel-native.a"])
