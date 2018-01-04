require 'pry'

class FiguresController < ApplicationController
	set :views, Proc.new { File.join(root, "../views/figures/") }

	get "/figures" do
		@figures = Figure.all
		erb :index
	end

	get "/figures/new" do
		erb :new
	end

	post "/figures" do
		@figure = Figure.create(params[:figure])
		@figure.titles.create(params[:title]) unless params[:title][:name] == ""
		@figure.landmarks.create(params[:landmark]) unless params[:landmark][:name] == ""
		erb :show
	end

	get "/figures/:id" do
		@figure = Figure.find(params[:id])
		erb :show
	end

	post "/figures/:id" do
		figure = Figure.find(params[:id])
		figure.update(params[:figure])
		figure.titles.create(params[:title]) unless params[:title][:name] == ""
	  figure.landmarks.create(params[:landmark]) unless params[:landmark][:name] == ""
		redirect "/figures/#{figure.id}"
	end

	get "/figures/:id/edit" do
		@figure = Figure.find(params[:id])
		erb :edit
	end

end
