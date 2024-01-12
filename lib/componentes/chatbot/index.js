
require('dotenv').config();


const express = require("express");        
const OpenAI = require("openai");  
const path = require("path");         

const app = express();
const port = 3000;                        

const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY,     
    
});


app.use(express.json());

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, 'chatbot_widget.dart'));  
});

app.post("/ask", async (req, res) => {
    const userQuestions = req.body.questions;

    let theQuestions = [{ 
        role: "system",
        content: "Eres un experto en SRI de Ecuador."
    }];

    if (userQuestions.length > 0) {
        userQuestions.forEach(e => {
            theQuestions.push(e);
        });
    }

    try {
        const gptResponse = await openai.chat.completions.create({
            model: "gpt-3.5-turbo",
            messages: theQuestions,
            temperature: 0.5,
            max_tokens: 1024,
        });

        res.send(gptResponse);

    } catch (error) {
        console.error("Error querying OpenAI:", error);
        res.status(500).send({ error: "Error obtaining response from GPT" });
    }
});


app.listen(port, () => {
    console.log(`Server listening at http://192.168.3.18:3000${port}`); //se debe cambiar el localhost segun desee
});
