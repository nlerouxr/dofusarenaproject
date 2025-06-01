class GamesController < ApplicationController

    def create
      @game = Game.new
      @character = Character.find(30)
      if @game.save
        @player = Player.new(user_id: params[:game][:selected_user_id], character_id: 30, game_id: @game.id, current_hp: @character.health_point, current_action_points: @character.action_point, current_movement_points: @character.movement_point)
        @player.save!
        redirect_to lobby_path, notice: "Partie créée avec succès !"
      else
        redirect_to lobby_path, alert: "Erreur de création de partie"
      end
    end

    def lobby
      @users = User.all
      @games = Game.where(status: 'pending')
    end

    def join
    end
end
