app = app || {}

app.allMoviesView = Backbone.View.extend({

  tagName: "section",

  render: () ->
 	  this.collection.each(this.addMovie, this)

  addMovie: (movie) ->
 		movieView = new app.singleMovieView ({ model: movie });
 		this.$el.append(movieView.render().el);

});
