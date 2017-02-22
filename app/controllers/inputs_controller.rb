class InputsController < ApplicationController
	def new
	end

	def create
    audio_input = input_params
    response = HTTParty.post("https://mezzomorphic-backend/channel/#{params[:id]}",
    {
      :body => {'input' =>
                {'name' => audio_input[:name], 'artist' => audio_input[:artist], 'audio' => audio_input[:audio]}}.to_json,
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    })
	end

	private

	def input_params
		params.require(:input).permit(:name, :artist, :audio)
	end

end