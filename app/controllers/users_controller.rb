class UsersController < ApplicationController
	def show
		response = HTTParty.get("https://mezzomorphic-backend/users/#{params[:id]}")
    @user = JSON.parse(response.body)
	end

	def new
	end

	def create
		user_input = user_params
    response = HTTParty.post('https://mezzomorphic-backend/users',
    {
      :body => {'user' =>
                {'name' => user_input[:name], 'email' => user_input[:email], 'password' => user_input[:password] }}.to_json,
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
    })

    if response.code == 201
      #add user auth with devise.
      response_hash =JSON.parse(response.body)
      redirect_to user_path(response_hash['id'])
    else
      redirect_to '/users/new'
    end
	end

	def edit
		response = HTTParty.get("https://mezzomorphic-backend/users/#{params[:id]}")
    response_hash = JSON.parse(response.body)
    @user = response_hash["data"]["attributes"]
    @id = response_hash["data"]["id"]
	end

	def update
	  user_input = user_params
    response = HTTParty.put("https://mezzomorphic-backend/users/#{params[:id]}",
    {
      :body => {'user' =>
                {'name' => user_input[:name], 'email' => user_input[:email]}
                }.to_json,
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}

    })
    if response.code == 200
      #add user auth with devise.
      redirect_to user_path(params[:id])
    else
      redirect_to "/users/#{params[:id]}/edit"
    end 
	end

	def destroy
	end

	private 

	def user_params
    params.require(:user).permit(:name, :email, :password)
		
	end
end