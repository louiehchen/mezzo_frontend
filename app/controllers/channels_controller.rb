class ChannelsController < ApplicationController
	def index
		response = HTTParty.get("https://mezzomorphic-backend/channels.json")
    response_hash = JSON.parse(response.body)
    @channels = response_hash["data"]

	end

	def show
		response = HTTParty.get("https://mezzomorphic-backend/channels/#{params[:id]}")
    @channel = JSON.parse(response.body)
	end

	def new
	end

	def create
	end

	def edit
		response = HTTParty.get("https://mezzomorphic-backend/channels/#{params[:id]}")
    response_hash = JSON.parse(response.body)
    @channel = response_hash["data"]["attributes"]
    @id = response_hash["data"]["id"]
	end

	def update 
	end

	def destroy
	end

end