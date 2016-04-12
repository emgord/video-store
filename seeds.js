// Generated by CoffeeScript 1.10.0
(function() {
  var DATABASE_URL, bodyParser, fs, pg;

  bodyParser = require('body-parser');

  pg = require('./lib/postgres');

  fs = require("fs");

  DATABASE_URL = 'postgres://emilygordon:@localhost/videostore';

  pg.initialize(DATABASE_URL, function(err) {
    if (err) {
      throw err;
    }
    return fs.readFile(__dirname + "/movies.json", 'utf8', function(err, data) {
      var i, len, movie, moviesArray, results, sql;
      if (err) {
        return console.log(err);
      } else {
        moviesArray = JSON.parse(data.toString());
        sql = 'INSERT INTO movie( title, overview,release_date, inventory) VALUES ($1,$2,$3,$4)';
        results = [];
        for (i = 0, len = moviesArray.length; i < len; i++) {
          movie = moviesArray[i];
          data = [movie.title, movie.overview, movie.release_date, movie.inventory];
          results.push(pg.client.query(sql, data, function(err, result) {
            if (err) {
              console.error(err);
              return console.log("Failed to create movie");
            } else {
              return console.log("Movie created");
            }
          }));
        }
        return results;
      }
    });
  });

}).call(this);
