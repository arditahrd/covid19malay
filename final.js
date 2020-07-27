//require
const NodeGeocoder = require('node-geocoder');
var request = require('request');
const fetch = require("node-fetch");
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
    password: "password",
    port: "5432"
});


function inputData(id, negeri, lat, long, cases, date) {
    pool.query(
        "INSERT INTO data_malay VALUES('" + id + "', '" + negeri + "', '" + lat + "', '" + long + "', '" + cases + "', '" + date + "')",
        (err, res) => {
            //console.log(err, res);
            console.log('data ' + id + ' berhasil disimpan');
        }
    );
}

function updateData(id, negeri, lat, long, cases, date) {
    pool.query(
        "UPDATE data_malay SET Negeri='" + negeri + "',Lat= '" + lat + "',Long = '" + long + "',Cases = '" + cases + "',Date= '" + date + "' where id = '" + id + "'",
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

                    for (var n = 0; n < total; n++) {

                        var kota = data.features[n].attributes.Negeri;
                        var id = data.features[n].attributes.OBJECTID;
                        var lat2 = data.features[n].attributes.Lat;
                        var long = data.features[n].attributes.Long;
                        var date = data.features[n].attributes.Date;
                        var kasus = data.features[n].attributes.Cases;

                        //get location
                        const mapOptions = {
                            provider: 'google',
                            apiKey: 'AIzaSyBRAnJsQlQEKOgsCNfp_bmBKWsBbN1fEu0',
                            formatter: null,
                        };

                        let address = [];
                        const geocoder = NodeGeocoder(mapOptions);
                        /*if (lat2 !== null && long !== null) {
                            address = await geocoder.reverse({ lat: lat2, long: long });
                        }*/

                        geocoder.geocode('2.9264, 101.6964', function (err, res) {
                            console.log(res);
                            let data = JSON.stringify(res);
                            fs.writeFileSync('WP Putrajaya.json', data);
                        });

                        //console.log(address);


                        jumlah_case += kasus;
                        if (count == 1) {
                            //inputData(id, kota, lat, long, kasus, date);
                        } else {
                            //console.log(id + ' ' + kota + ' '+kasus);
                            //updateData(id, kota, lat, long, kasus, date);
                        }


                    }
                    //console.log("Jumlah kasus : " + jumlah_case);

                    count = 4;

                }
            })
    }, 5 * 1000);
}

fetchData();