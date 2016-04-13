#Namespace for app
app = app || {}

# A group (array) of movie models
app.MoviesCollection = Backbone.Collection.extend({

  # What type of models are in this collection?
  model: app.singleMovie,
  url: "http://localhost:3000/movie"

})

movies = new app.MoviesCollection().fetch()
