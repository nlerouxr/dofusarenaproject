class UsersController < ApplicationController
    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            respond_to do |format|
                format.html { redirect_to root_path, notice: "Compte créé avec succès." }
                format.json { render json: @user, status: :created }
            end
        else
            respond_to do |format|
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity }
            end
        end
    end

    def new
        @user = User.new
    end
    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
