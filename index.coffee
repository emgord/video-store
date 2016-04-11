express = require('express')
bodyParser = require('body-parser')
app = express()

app.get('/zomg', (req,res) ->
  res.send('it works!')
)

module.exports = app
