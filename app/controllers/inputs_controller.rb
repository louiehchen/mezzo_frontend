class InputsController < ApplicationController
	def new
	end

	def create
	end

	private

	def input_params
		params.require(:input).permit(:name, :artist, :audio)
	end

end