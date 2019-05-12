class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(user_params)
    redirect_to weapons_path
  end

  def delete
  end

  def show
  end

  private

  def user_params
    params.require(:weapon).permit(:name, :description, :power_base ,:power_step ,:level)
  end 
end
