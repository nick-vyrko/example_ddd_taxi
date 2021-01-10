class RidesController < ApplicationController
  def index
    @rides = Rides::Ride.all
  end

  def show
    @ride = Rides::Ride.find(params[:id])
  end

  def new
    @users = User.all.pluck(:name, :id)
    @drivers = Driver.joins('INNER JOIN users ON drivers.user_id = users.id')
                     .select('drivers.id', 'users.name').pluck(:name, :id)
  end

  def create
    command = ::Traffic::Commands::CreateRide.new(ride_params.merge(ride_uid: ride_uuid).to_h.symbolize_keys)
    command_bus.call(command)

    redirect_to ride_path(Rides::Ride.find_by(uid: command.ride_uid)), notice: 'Ride was successfully submitted.'
  end

  private

  def ride_params
    params.permit(:user_id, :driver_id)
  end

  def ride_uuid
    SecureRandom.uuid
  end
end
