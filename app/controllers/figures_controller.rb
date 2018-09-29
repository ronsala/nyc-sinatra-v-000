class FiguresController < ApplicationController
  
  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    # binding.pry
    # @figure = Figure.create(params[:figure])
    @figure = Figure.create(:name=> params[:figure][:name])

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:figure][:title])
    end

    if !params[:title_ids].empty?
      params[:figure][:title_ids].each_index do | i |
      @figure.titles << Title.create(params[:figure][:title_ids][i])
      end
    end

  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    # binding.pry
    erb :"figures/edit"
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:name]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    erb :"/figures/show"
  end

  get "/figures" do
    @figures = Figure.all
    erb :"figures/index"
  end
end
