class SessionsController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    def signup
        user = User.new(email: params[:email], password: params[:password], mobile_number: params[:mobile_number])
        if user.save 
            profile = Profile.new(name: params[:email], user_id: user.id)
            if profile.save 
                render json: { message: "Signup Successfully" }, status: :created
            else
                render json: { message: profile.errors }, status: :unprocessable_entity
            end
        else
            render json: { message: user.errors }, status: :unprocessable_entity
        end
    end 

    require 'jwt'
    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            # render json: { message: "Login Successfully" }, status: :ok
            token = encode_user_data({ user_data: user.id })
  
            # return token to user
            render json: { token: token, representer: ProfileRepresenter.new(user).as_json }, status: :created
        else
            render json: { message: "Invalid credentials" }, status: :unauthorized
        end
    end

    private
        def parameter_missing(e)
            render json: {error: e.message}, status: :unprocessable_entity
        end

end