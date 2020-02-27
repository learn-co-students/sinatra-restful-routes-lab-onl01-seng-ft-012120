class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  get '/recipes/new' do
    erb :'recipes/new'
  end

  post '/recipes' do
    object = Recipe.create(params)
    redirect "/recipes/#{object.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :'recipes/show'
  end
   get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :'recipes/edit'
  end

  delete '/recipes/:id' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.destroy
    redirect '/recipes'
  end

  # patch vs put best patterns to follow?
  patch '/recipes/:id' do
    recipe = Recipe.find_by_id(params[:id])
    info = params.reject{|k,v| k == 'id' || k == '_method'}
    recipe.update(info)
    redirect "/recipes/#{recipe.id}"

    # info = params.reject{|k,v| k == 'id' || k == '_method'}
    # Recipe.update(params[:id],info)
    # redirect "/recipes/#{params[:id]}"

  end
  


end
