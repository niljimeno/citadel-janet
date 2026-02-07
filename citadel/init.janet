(import "./db")
(import "./router")

(and (db/setup)
     (router/start))
