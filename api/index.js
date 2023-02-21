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
const PORT = process.env.PORT || 3000;

app.get("/travel", async (req, res) => {
  try {
    var location = req.query.id;
    const redis = require("redis");
    const redisUrl = "redis://127.0.0.1:6379";
    const client = redis.createClient(redisUrl);
    await client.connect();
    //do we have cached data in redis related to the query
    const cachedBlog = await client.get(location.toLowerCase());

    //if yes then respond to request right away and return
    if (cachedBlog) {
      console.log("Serving from cache");
      return res.send(JSON.parse(cachedBlog));
    }

    //if no we need to respond and update the cache
    console.log(location);
    push_data();
    async function push_data() {
      await test();
      var d = JSON.stringify(obj);
      if (location == "bengaluru") {
        location = "bangalore";
      }
    }
    async function test() {
      await poi(location);
      await food(location);
      await hotels(location);
      console.log("Serving from web");
      res.send(obj);
      // await client.set(location.toLowerCase(), JSON.stringify(obj));
    }
  } catch (err) {
    res.status(500).json(err);
  }
});
app.get("/", (req, res) => res.send("Hello Pumpkin"));
app.listen(PORT, () =>
  console.log("server is running!!! at http://localhost:3000/")
);
