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
  fs.readFile( __dirname + "/customers.json", 'utf8', (err, data) ->
    if err
      console.log err
    else
      customerArray = JSON.parse(data.toString())
      sql = 'INSERT INTO customer( name, registered_at, address,city, state, postal_code, phone, account_credit) VALUES ($1,$2,$3,$4,$5,$6,$7,$8)'
      for customer in customerArray
        data = [
          customer.name
          customer.registered_at,
          customer.address
          customer.city
          customer.state
          customer.postal_code
          customer.phone
          customer.account_credit
        ]
        pg.client.query(sql, data, (err, result) ->
          if err
            console.error(err)
            console.log "Failed to create customer"
          else
            console.log "customer created"
          )
        )
  )
