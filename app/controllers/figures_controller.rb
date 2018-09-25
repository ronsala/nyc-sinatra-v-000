class FiguresController < ApplicationController
  
  get "/figures/new" do
    erb :"figures/new"
  end

  get "/figures/:id" do
    # @figure = Figure.find(:id)
    # binding.pry
    erb :"/figures/show"
  end

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end

  post "/figures" do
    binding.pry
  end
end
