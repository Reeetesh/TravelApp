const puppeteer = require("puppeteer");
let obj = require("../data/object");

module.exports = async function (location) {
  try {
    const browser = await puppeteer.launch({
      executablePath: "/usr/bin/chromium-browser",
    });
    const page = await browser.newPage();
    await page.goto(
      `https://www.holidify.com/places/${location}/sightseeing-and-things-to-do.html`
    );
    let data = await page.evaluate(() => {
      let results = [];
      let items = document.querySelectorAll(".content-card");
      items.forEach((items) => {
        results.push({
          foto_url: items
            .querySelector(".card-img-top")
            .getAttribute("data-original"),
          title: items.querySelector(".card-heading").innerHTML,
        });
      });
      return results;
    });
    obj["Point_of_Interests"]=[];
    if (data.length > 0) obj["Point_of_Interests"] = data;
    // console.log(data);
    await browser.close();
  } catch (error) {
    console.error(error);
  }
};
