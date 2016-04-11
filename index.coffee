express = require('express')
bodyParser = require('body-parser')

app = express()
app.use(bodyParser.json({type: 'application/json'}))

postgres = require('./lib/postgres');

lookupMovie = (req, res, next) ->
  movieId = req.params.id
  sql = 'SELECT * FROM movie WHERE id = $1'
  postgres.client.query(sql, [movieId], (err,results) ->
    if err
      console.error(err)
      res.statusCode = 500
      return res.json( errors: ['Could not retrieve movie'])
    if results.rows.length == 0
      res.statusCode = 404
      return res.json( {errors: ['Movie not found']})

    req.movie = results.rows[0];
    next();
  )


movieRouter = express.Router()
movieRouter.get('/', (req, res) -> )
movieRouter.post('/', (req, res) ->
  sql = 'INSERT INTO movie( title, overview,release_date, inventory) VALUES ($1,$2,$3,$4) RETURNING id'
  data = [
    req.body.title
    req.body.overview
    req.body.release_date
    req.body.inventory
  ]
  postgres.client.query(sql, data, (err, result) ->
    if err
      console.error(err)
      res.statusCode = 500
      return res.json({
        errors: ['Failed to create movie']
        })
    movieId = result.rows[0].id
    sql = 'SELECT * FROM movie WHERE id = $1'
    postgres.client.query(sql, [movieId], (err, result) ->
      if err
        console.error(err)
        res.statusCode = 500
        return res.json({
          errors: ['Could not retrieve movie after create']
          })
      res.statusCode = 201
      res.json(result.rows[0]
      )
    )
  )
)
movieRouter.get('/:id', lookupMovie, (req, res) ->
  res.json(req.movie)
  )
movieRouter.patch('/:id', lookupMovie, (req, res) -> )
movieRouter.delete('/:id', lookupMovie, (req, res) -> )
app.use('/movie',movieRouter)

customerRouter = express.Router()
customerRouter.get('/', (req, res) -> )
customerRouter.post('/', (req, res) -> )
customerRouter.get('/:id', (req, res) -> )
customerRouter.patch('/:id', (req, res) -> )
customerRouter.delete('/:id', (req, res) -> )
app.use('/customer',customerRouter)

rentalRouter = express.Router()
rentalRouter.get('/', (req, res) -> )
rentalRouter.post('/', (req, res) -> )
rentalRouter.get('/:id', (req, res) -> )
rentalRouter.patch('/:id', (req, res) -> )
rentalRouter.delete('/:id', (req, res) -> )
app.use('/rental',rentalRouter)

app.get('/zomg', (req,res) ->
  res.send('it still still works!')
)

module.exports = app
