bodyParser = require('body-parser')
pg = require('./lib/postgres')
fs = require("fs")

DATABASE_URL = 'postgres://emilygordon:@localhost/videostore'

#Connect to mysql database
pg.initialize(DATABASE_URL, (err) ->
  if err
    throw err
  fs.readFile( __dirname + "/movies.json", 'utf8', (err, data) ->
    if err
      console.log err
    else
      moviesArray = JSON.parse(data.toString())
      sql = 'INSERT INTO movie( title, overview,release_date, inventory) VALUES ($1,$2,$3,$4)'
      for movie in moviesArray
        data = [
          movie.title
          movie.overview
          movie.release_date
          movie.inventory
        ]
        pg.client.query(sql, data, (err, result) ->
          if err
            console.error(err)
            console.log "Failed to create movie"
          else
            console.log "Movie created"
          )
        )
  )
