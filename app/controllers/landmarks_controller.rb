class LandmarksController < ApplicationController
  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
end
