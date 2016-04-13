app = app || {}

app.singleMovieView = Backbone.View.extend({

  tagName: "article",
  className: "movieListItem",

  template: _.template( $("#movieElement").html() ),

  render: () ->
    movieTemplate = this.template(this.model.toJSON());
    this.$el.html(movieTemplate)
  ,

})
