// const express = require('express')
// require('dotenv').config()
import express from "express";
const app = express()
const port = process.env.PORT || 4000

app.get('/', (req, res) => {
  res.send('Hello World!')
})


app.get('/jokes', (req,res)=>{
    const jokes = [
        {
            id:0,
            title:"ant's eats elephats",
            joke:"everything"
        },
      {
        id: 1,
        title: "Why don't scientists trust atoms?",
        joke: "Because they make up everything!"
      },
      {
        id: 2,
        title: "Why did the bicycle fall over?",
        joke: "Because it was two-tired!"
      },
      {
        id: 3,
        title: "What do you call fake spaghetti?",
        joke: "An impasta!"
      },
      {
        id: 4,
        title: "Why can't you give Elsa a balloon?",
        joke: "Because she will let it go!"
      },
      {
        id: 5,
        title: "How do you organize a space party?",
        joke: "You planet!"
      },
    
    ];
    res.send(jokes);
    
    });
app.get("/about",(req,res)=>{
    res.send("this is my about page")
})

app.get("/login", (req,res)=>{
    res.send("<h1>this is my login page</h1>")
})

app.get("/data", (req,res)=>{
    res.json(
        {
            "name":"muneeb",
            "id":"14"
        }
    )
})

// app.listen(port, () => {
//   console.log(`Example app listening on port ${port}`)
// })

app.listen(port,"0.0.0.0",()=>{
    console.log(`:::::::::::::::::::::::::::server is run at http://localhost:${port}`);
});