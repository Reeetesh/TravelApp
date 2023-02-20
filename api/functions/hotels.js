const puppeteer = require("puppeteer");
let obj = require("../data/object")

module.exports = async function hotels(location) {
  try {
    const browser = await puppeteer.launch({
      
    });
    const page = await browser.newPage();

    await page.goto(
      `https://www.holidify.com/places/${location}/hotels-where-to-stay.html`
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
    obj["Hotels"]=[];
    if (data.length > 0) obj["Hotels"] = data;
    await browser.close();
  } catch (error) {
    console.error(error);
  }
};
