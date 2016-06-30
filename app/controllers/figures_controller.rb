class FiguresController < ApplicationController

set :views, 'app/views/figures'

	get '/figures' do
		@figures = Figure.all
		erb :index
	end

	get '/figures/new' do
		erb :new
	end

	get '/figures/:id' do
		@figure = Figure.find(params["id"])
		erb :show
	end

	get '/figures/:id/edit' do
		@figure = Figure.find(params["id"])
		erb :edit
	end

	patch '/figures/:id' do
		@figure = Figure.find(params["id"])
		@figure.update(params["figure"])
		@figure.landmarks << Landmark.create(params["landmark"]) if !params["landmark"]["name"].empty? 
		@figure.titles << Title.create(params["title"]) if !params["title"]["name"].empty? 
		@figure.save
		redirect "/figures/#{@figure.id}"
	end

	get '/figures/:id' do
		@figure = Figure.find(params["id"])
		erb :show
	end

	post '/figures' do
		@figure = Figure.create(params["figure"])
		@figure.landmarks << Landmark.create(params["landmark"]) if !params["landmark"]["name"].empty? 
		@figure.titles << Title.create(params["title"]) if !params["title"]["name"].empty? 
		@figure.save
		redirect "/figures/#{@figure.id}"
	end



end
