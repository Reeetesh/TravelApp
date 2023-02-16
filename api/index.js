const express = require("express");

const app = express();
const poi = require("./functions/poi");
const hotels = require("./functions/hotels");
const food = require("./functions/food");
var cors = require("cors");
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(cors());
let obj = require("./data/object");
const PORT = process.env.PORT || 5000;

app.get("/travel", async (req, res) => {
  try {
    var location = req.query.id;
    console.log(location);
    async function test() {
      await poi(location);
      await food(location);
      await hotels(location);
      res.send(obj);
    }
    push_data();
    async function push_data() {
      await test();
      var d = JSON.stringify(obj);
      if (location == "bengaluru") {
        location = "bangalore";
      }
    }
  } catch (err) {
    res.status(500).json(err);
  }
});
app.get("/", (req, res) => res.send("Hello Pumpkin"));
app.listen(PORT, () =>
  console.log("server is running!!! at http://localhost:5000/")
);
