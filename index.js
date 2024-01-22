// Load environnement variables
import "dotenv/config";

// Import NPM dependencies
import express from "express";
import session from "express-session";


// Import local dependencies
import { router as apiRouter } from "./app/routers/index.router.js";

// Create Express App
const app = express();

app.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: { secure: false },
  })
);

// Add body parser
app.use(express.urlencoded({ extended: true })); // Ce body parser est capable de parser les body au format application/x-www-urlencoded (eg, les body envoyé par un <form> HTML)
app.use(express.json()); // Ce body parser parse les body au format application/json

// Configure Express app
app.use("/api", apiRouter);

// Start express app
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}/api`);
});