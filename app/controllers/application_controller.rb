class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get "/recipes" do
    erb :index
  end
  
  post "/recipes" do
    recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.save
    redirect "/recipes/#{recipe.id}"
  end
    
  get "/recipes/new" do
    erb :new
  end

  get "/recipes/:id" do
    @recipe = Recipe.all.find_by_id(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.all.find_by_id(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.all.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    
    erb :show
  end

  delete "/recipes/:id" do
    @recipe = Recipe.all.find_by_id(params[:id])
    @recipe.destroy
    redirect "/recipes"
  end


end
