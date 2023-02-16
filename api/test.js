const puppeteer = require("puppeteer");
const prompt = require("prompt-sync")({ sigint: true });
var location = prompt("What is your dream destination?\t");

var admin = require("firebase-admin");
const serviceAccount = require("./serviceAccountKey.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://douglas-41e57-default-rtdb.firebaseio.com/",
  authDomain: "douglas-41e57.firebaseapp.com",
});





var database = admin.database();
let obj=new Object();



const URL1 =
  `https://www.holidify.com/places/${location}/sightseeing-and-things-to-do.html`;
  const URL2 =
  `https://www.holidify.com/places/${location}/hotels-where-to-stay.html`;  
  // const URL3 =
  // `https://www.swiggy.com/city/${location}`;









async function pointOfIntrest() {
  try {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();

    await page.goto(URL1);
    let data= await page.evaluate(() => {
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
    obj["Point_of_Interests"]=data;
    await browser.close();
  } catch (error) {
    console.error(error);
  }
}










// async function food() {
//   try {
//     const browser = await puppeteer.launch();
//     const page = await browser.newPage();

//     await page.goto(URL3);
//     let data = await page.evaluate(() => {
//       let results = [];
//       let items = document.querySelectorAll("._1HEuF");
//       items.forEach((items) => {
//         results.push({
//           foto_url: items.querySelector('img')? items.querySelector('img').src : null,
//           title: items.querySelector(".nA6kb").innerHTML,
//         });
//       });
//       return results;
//     });
//     // console.log(data);
//     obj["food"]=data;
// 		// await page.screenshot({ path: 'screenshot.png' })

//     await browser.close();
//   } catch (error) {
//     console.error(error);
//   }
// }










async function food() {
  if(location == 'bangalore') {
      location = 'bengaluru';
}
  try {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    var URL3 =
    `https://restaurant-guru.in/${location}#restaurant-list`;
    await page.goto(URL3);
    let data = await page.evaluate(() => {
      let results = [];
      let items = document.querySelectorAll(".restaurant_row");
      items.forEach((items) => {
        results.push({
          foto_url: items.querySelector('.restaurant-img')? items.querySelector('img').src : null,
          title: items.querySelector(".notranslate").innerHTML
        });
      });
      return results;
    });
    obj["Food"]=data;
    // await page.screenshot({ path: 'screenshot.png' })

    await browser.close();
  } catch (error) {
    console.error(error);
  }
}








async function hotels() {
  try {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();

    await page.goto(URL2);
    let data = await page.evaluate(() => {
      let results = [];
      let items = document.querySelectorAll(".content-card");
      items.forEach((items) => {
        results.push({
          foto_url: items
          .querySelector(".card-img-top")
          .getAttribute("data-original"),
          title: items.querySelector(".card-heading").innerHTML
        });
      });
      return results;
    });
    obj["Hotels"]=data;
    await browser.close();
  } catch (error) {
    console.error(error);
  }
}




async function test(){
  await pointOfIntrest();
  await food();
  await hotels();
}

async function push_data(){
  await test();
  var d = JSON.stringify(obj);
  if(location == 'bengaluru') {
    location = 'bangalore';
}
  database.ref(`location_data_${location}`).set(obj, function(error) {
        if (error) {
          // The write failed...
          console.log("Failed with error: " + error)
        } else {
          // The write was successful...
          console.log("success")
        }
    })
}

push_data();