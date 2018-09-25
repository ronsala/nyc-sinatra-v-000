class FiguresController < ApplicationController

  get "/figures/new" do
    erb :"figures/new"
  end

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end
end
