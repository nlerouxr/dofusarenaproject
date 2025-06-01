class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Connexion réussie.'
    else
     render json: { errors: "Invalid username or password"}, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Déconnexion réussie.'
  end
end
