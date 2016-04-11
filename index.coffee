express = require('express')
bodyParser = require('body-parser')
app = express()

movieRouter = express.Router()
movieRouter.get('/', (req, res) -> )
movieRouter.post('/', (req, res) -> )
movieRouter.get('/:id', (req, res) -> )
movieRouter.patch('/:id', (req, res) -> )
movieRouter.delete('/:id', (req, res) -> )
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
