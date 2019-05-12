class EnemiesController < ApplicationController
  before_action :set_enemy

  def update
    if @enemy.update(enemy_params)
      render json: @enemy, status: :ok
    else
      render json: { errors: @enemy.errors }, status: unprocessable_entity  
    end
  end

  def destroy
    @enemy.destroy
    head 204
  end

  private

  def enemy_params
    params.permit(:name, :power_base, :power_step, :kindm :level)
  end

  def set_enemy
    @enemy = Enemy.find(params[:id])
  # Se o ID for invalido, não encontra nada e então capita o erro
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end
end
