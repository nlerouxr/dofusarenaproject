class GamesController < ApplicationController

  before_action :set_game, only: [:show, :join]

    def show
    end

    def create
      @game = Game.new
      @character = Character.find(30)
      if @game.save
        @player = Player.new(user_id: params[:game][:selected_user_id], character_id: 30, game_id: @game.id, current_hp: @character.health_point, current_action_points: @character.action_point, current_movement_points: @character.movement_point)
        #user id devra etre l'id de l'user en session, et le character devra etre celui qu'il a selectionné
        @player.save!
        redirect_to lobby_path, notice: "Partie créée avec succès !"
      else
        redirect_to lobby_path, alert: "Erreur de création de partie"
      end
    end

    def lobby
      @users = User.all
      @games = Game.where(status: ['pending', 'full'])
    end

    def join
        @character = Character.find(30)
        @player2 = Player.new(user_id: User.find(21).id, character_id: 30, game_id: params[:id], current_hp: @character.health_point, current_action_points: @character.action_point, current_movement_points: @character.movement_point )
        #user_id devra etre l'id de l'user en session et le character celui qu'il a choisi
        if @player2.save
          @game.update(status: "full")
          redirect_to lobby_path
        else
          redirect_to lobby_path
        end
    end

    private

    def set_game
      @game = Game.find(params[:id])
    end

  end
