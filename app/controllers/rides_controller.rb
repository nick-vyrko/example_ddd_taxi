class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def new
    @ride = Ride.new(user_id: User, driver_id: Driver)
  end

  def create

  end
end
