//require
var request = require('request');
const fetch = require("node-fetch");
const NodeGeocoder = require('node-geocoder');
const fs = require('fs');

const {
    Pool,
    Client
} = require("pg");

//connection
const pool = new Pool({
    user: "postgres",
    host: "localhost",
    database: "covid19malay",
    password: "123456",
    port: "5432"
});


function inputData(id, negeri, lat, long, cases, date, a, b, c, d, e) {
    pool.query(
        "INSERT INTO cvd VALUES(null, '" + negeri + "', '" + lat + "', '" + long + "', '" + cases + "', '" + date + "','" + a + "','" + b + "','" + c + "','" + d + "','" + e + "')",
        (err, res) => {
            console.log(err, res);
            //console.log('data ' + id + ' berhasil disimpan');
        }
    );
}

function updateData(id, negeri, lat, long, cases, date) {
    pool.query(
        "UPDATE data SET Negeri='" + negeri + "',Lat= '" + lat + "',Long = '" + long + "',Cases = '" + cases + "',Date= '" + date + "' where id = '" + id + "'",
        (err, res) => {
            console.log('data ' + id + ' telah berhasil diubah');
        }
    );
}

var count = 1;

function fetchData() {

    var interval = setInterval(function () {
        request('https://www.map2uapps.com/server/rest/services/COVID19/COVID19_DailyHeatmap/FeatureServer/0/query?f=json&returnGeometry=true&spatialRel=esriSpatialRelIntersects&geometry={%22xmin%22%3A-20037508.342788905%2C%22ymin%22%3A-60112525.02834715%2C%22xmax%22%3A20037508.342788905%2C%22ymax%22%3A20037508.342788905%2C%22spatialReference%22%3A{%22wkid%22%3A102100}}&geometryType=esriGeometryEnvelope&inSR=102100&outFields=*&outSR=102100&resultType=tile',
            async function (error, response, body) {
                if (!error && response.statusCode == 200) {

                    var data = JSON.parse(body);
                    var total = data.features.length;
                    console.log(total);

                    var jumlah_case = 0;

                    const mapOptions = {
                        provider: 'google',
                        apiKey: 'AIzaSyBRAnJsQlQEKOgsCNfp_bmBKWsBbN1fEu0',
                        formatter: null,
                    };

                    for (var n = 0; n < total; n++) {
                        var kota = data.features[n].attributes.Negeri;
                        var id = data.features[n].attributes.OBJECTID;
                        var lat = data.features[n].attributes.Lat;
                        var long = data.features[n].attributes.Long;
                        var date = data.features[n].attributes.Date;
                        var kasus = data.features[n].attributes.Cases;

                        jumlah_case += kasus;
                        //console.log(id + ' ' + kota + ' '+kasus);
                        //get location


                        let address = [];
                        const geocoder = NodeGeocoder(mapOptions);
                        /*if (lat2 !== null && long !== null) {
                            address = await geocoder.reverse({ lat: lat2, long: long });
                        }*/

                        await geocoder.geocode(lat + ', ' + long, async function (err, res) {
                            //console.log(res);
                            let data = JSON.stringify(res);
                            await fs.writeFileSync('./json/' + kota + '.json', data);

                            var jml = res.length;

                            for (var x = 0; x < jml; x++) {
                                var street = res[x].streetName;
                                var city = res[x].city;
                                var country = res[x].country;
                                var countryCode = res[x].countryCode;
                                var zipcode = res[x].zipcode;

                                console.log(kota + ' - ' + res[x].formattedAddress);
                                await inputData(x, kota, lat, long, kasus, date, street, city, country, countryCode, zipcode);
                            }

                        });

                    }
                    console.log("Jumlah kasus : " + jumlah_case);

                    count = 4;

                }
            })
    }, 5 * 1000);
}

fetchData();
