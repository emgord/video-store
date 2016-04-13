app = app || {}

app.singleMovie = Backbone.Model.extend({

  defaults: {
      title: "",
      overview: "",
      release_date: "",
      inventory: 0
  },

  urlRoot: "http://localhost:3000/movie"

})
