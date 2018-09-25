class FiguresController < ApplicationController

  get "/figures/new" do
    @figures = Figure.all
    erb :"figures/new"
  end

  get "/figures" do
    erb :"figures/index"
  end
end
