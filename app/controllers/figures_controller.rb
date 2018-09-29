class FiguresController < ApplicationController
  
  get "/figures/new" do
    erb :"figures/new"
  end

  post "/figures" do
    # binding.pry
    @figure = Figure.create(:name => params["figure"]["name"], :title_ids => params["figure"]["title_ids"], :landmark_ids => params["figure"]["landmark_ids"])

    if !params[:title][:name].empty?       
      @figure.titles << Title.create(params[:title])    
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect '/figures'

    # if !params[:title][:name].empty?
    #   @figure.titles << Title.create(params[:figure][:title])
    # end

    # if !params[:figure][:title_ids].empty?
    #   params[:figure][:title_ids].each_with_index do | t, i |
    #   @figure.titles << Title.find_by_id(params[:figure][:title_ids][i])
    #   end
    #   @figure.save
    # end

    # create a new figure with a landmark
    # if !params[:figure][:landmark_ids].empty?
      # binding.pry
      # params[:figure][:landmark_ids].each_with_index do | l, i |
      # @figure.landmarks << Landmark.find_by_id(params[:figure][:landmark_ids][i])
      # end
      # @figure.save
    # end
 

    #    create a new figure with a new landmark
    # if !params[:figure][:landmark][:name].empty? && !params[:figure][:landmark][:year].empty?
    #   @figure.landmarks << Landmark.create(:name => params[:figure][:landmark][:name], :year_completed => params[:figure][:landmark][:year])
    #   @figure.save
    # end
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
