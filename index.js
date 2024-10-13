const express = require('express')
require('dotenv').config()
const app = express()
// const port = 4000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get("/about",(req,res)=>{
    res.send("this is my about page")
})

app.get("/login", (req,res)=>{
    res.send("<h1>this is my login page</h1>")
})

app.listen(process.env.PORT, () => {
  console.log(`Example app listening on port ${process.env.PORT}`)
})