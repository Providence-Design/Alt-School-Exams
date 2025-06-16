const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(express.static("public"));

app.post("/contact", (req, res) => {
  const { name, email, message } = req.body;
  console.log("Message received:", { name, email, message });
  res.status(200).send({ success: true, message: "Message received." });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
