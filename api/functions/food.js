const puppeteer = require("puppeteer");
let obj = require("../data/object");

module.exports = async function food(location) {
  if (location == "bangalore") {
    location = "bengaluru";
  }
  try {
    const browser = await puppeteer.launch({
      executablePath: "/usr/bin/chromium-browser",
    
    });
    const page = await browser.newPage();
    var URL3 = `https://restaurant-guru.in/${location}#restaurant-list`;
    await page.goto(URL3);
    let data = await page.evaluate(() => {
      let results = [];
      let items = document.querySelectorAll(".restaurant_row");
      items.forEach((items) => {
        results.push({
          foto_url: items.querySelector(".restaurant-img")
            ? items.querySelector("img").src
            : null,
          title: items.querySelector(".notranslate").innerHTML,
        });
      });
      // console.log(results);
      return results;
    });
    obj["Food"]=[];
    if (data.length > 0) obj["Food"] = data;
    // await page.screenshot({ path: 'screenshot.png' })

    await browser.close();
  } catch (error) {
    console.error(error);
  }
};
