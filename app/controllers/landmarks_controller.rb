class LandmarksController < ApplicationController
  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
end
