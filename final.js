//require
var request = require('request');
const fetch = require("node-fetch");
const NodeGeocoder = require('node-geocoder');
const fs = require('fs');

//load postgre driver
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


//function to insert data to PostgreSQL
function inputData(id, province, lat, long, cases, date, a, b, c, d, e) {
    pool.query(
        "INSERT INTO data_malay_ver3  VALUES('" + id + "','" + province + "', '" + lat + "', '" + long + "', '" + cases +
        "', '" + date + "','" + a + "','" + b + "','" + c + "','" + d + "','" + e + "')",
        (err, res) => {
            //console.log(err, res);
            console.log('data ' + id + ' berhasil disimpan');
        }
    );
}


//function to update data
function updateData(id, province, lat, long, cases, date, streetname, city, country, countrycode, zipcode) {
    pool.query(
        "UPDATE data_malay_ver3 SET province='" + province + "',lat= '" + lat + "',long = '" + long + "',cases = '" + cases +
        "',date= '" + date + "',streetname='" + streetname + "',city='" + city + "',country='" + country +
        "',countryCode='" + countrycode + "',zipcode='" + zipcode + "'  where id = '" + id + "'",

        (err, res) => {
            //console.log(err,res);
            console.log('data ' + id + ' telah berhasil diubah');
        }
    );
}

//variable to check if it's first running or not
var first = true;

//main function
function fetchData() {

    //create interval with function
    var interval = setInterval(function () {
        //fetch data from URL
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
                        //extract JSON from URL
                        var kota = data.features[n].attributes.Negeri;
                        var id = data.features[n].attributes.OBJECTID;
                        var lat = data.features[n].attributes.Lat;
                        var long = data.features[n].attributes.Long;
                        var date = data.features[n].attributes.Date;
                        var kasus = data.features[n].attributes.Cases;

                        //count total case
                        jumlah_case += kasus;

                        //show id, city and case
                        console.log(id + ' ' + kota + ' ' + kasus);

                        //create geocoder constanta from NodeGeocoder
                        const geocoder = NodeGeocoder(mapOptions);

                        //extract geocoder data from specific Latitude and Longitude
                        await geocoder.geocode(lat + ', ' + long, async function (err, res) {

                            //Un-comment this code to save data to JSON file
                            /*let data = JSON.stringify(res);
                            fs.writeFileSync('./json/' + kota + '.json', data); */

                            //count data from geocode
                            var jml = res.length;

                            //looping
                            for (var x = 0; x < jml; x++) {
                                
                                //fetch data from geocode and save it into variables
                                var street = res[x].streetName;
                                var city = res[x].city;
                                var country = res[x].country;
                                var countryCode = res[x].countryCode;
                                var zipcode = res[x].zipcode;

                                //show data
                                console.log(kota + ' - ' + res[x].formattedAddress);

                                //check is it first run
                                if (first == true) {
                                    //calling inputData function
                                    await inputData(id, kota, lat, long, kasus, date, street, city, country, countryCode, zipcode);
                                } else {
                                    //calling updateData function
                                    await updateData(id, kota, lat, long, kasus, date, street, city, country, countryCode, zipcode);
                                }
                            }

                        });

                    }

                    //show total case
                    console.log("Jumlah kasus : " + jumlah_case);

                    //set it's not the first run any longer
                    first = false;

                }
            })
       //set interval 5 seconds     
    }, 5 * 1000);
}

//calling function
fetchData();