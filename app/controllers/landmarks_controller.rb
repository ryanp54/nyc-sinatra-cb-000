class LandmarksController < ApplicationController
	set :views, Proc.new { File.join(root, "../views/landmarks/") }

	get "/landmarks" do
		@landmarks = Landmark.all
		erb :index
	end

	get "/landmarks/new" do
		erb :new
	end

	post "/landmarks" do
		@landmark = Landmark.create(params[:landmark])
		erb :show
	end

	get "/landmarks/:id" do
		@landmark = Landmark.find(params[:id])
		erb :show
	end

	post "/landmarks/:id" do
		landmark = Landmark.find(params[:id])
		landmark.update(params[:landmark])
		redirect "/landmarks/#{landmark.id}"
	end

	get "/landmarks/:id/edit" do
		@landmark = Landmark.find(params[:id])
		erb :edit
	end


end
