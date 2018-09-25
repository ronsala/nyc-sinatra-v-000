class FiguresController < ApplicationController
  
  get "/figures/new" do
    erb :"figures/new"
  end

  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = figure.find_by_id(params[:id])
    erb :edit
  end
 
  # patch '/figures/:id' do
  #   @figure = figure.find_by_id(params[:id])
  #   # @figure.title = params[:title]
  #   # @figure.content = params[:content]
  #   # @figure.save
  #   # redirect to "/figures/#{@figure.id}"
  # end

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  post "/figures" do
    binding.pry
  end
end
