const express = require("express");
const app = express();
const cors = require("cors");
const mysql = require("mysql");
const bodyParser = require('body-parser');
app.use(bodyParser.json());

Ezek a kódsorok engedélyezik a modulok használatát, betöltését, ami szükséges lehet egy szervernek.
Pl. const mysql = require("mysql"); - ez szükséges ahhoz, hogy elérjünk egy adatbázist
vagy pl. const cors = require("cors"); - ezzel lehet hozzá férni az API-hoz.



const db = mysql.createConnection({
    user: "root",
    host: "127.0.0.1",
    port: 3307,
    password: "",
    database: "kozutak",
}); 

Ez a kódblokk kapcsolatot hozz létre a szerver és az adatbázis között, így el lehet érni az adatbázist.
Pl. port: 3307, - a 3307 porton tud futni a szerver,
database: "kozutak", - a "kozutak" nevezetű adatbázist éri el.



app.get("/", (req, res) => {
    res.send("Fut a backend!");
})

Ez a kódblokk leginkább arra szolgál, hogy leteszteljük, hogy fut-e a szerver rendesen.
Ha rendesen fut, akkor a "Fut a backend!" szöveget fogja kiíratni.



app.get("/regiok", (req, res) => {
    const sql = "SELECT * FROM `regiok`";
    db.query(sql, (err, result) => {
        if (err) return res.json(err);
        return res.json(result)
    })
})  

Ez a kódblokk meghívja a "regiok" táblát és leteszteli, hogy jók-e az adatok a táblában lekérdezésekkel.
Ha hiba van benne, akkor visszaküldi az adatokat egy JSON fájlban hibásan.
Ha viszont nincs benne hiba, akkor az összes adatot visszaküldi szintén egy JSON fájlba.