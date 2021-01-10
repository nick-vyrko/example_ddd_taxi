module Rides
  class OnRideCreated
    def call(event)
      return if Ride.where(uid: event.data[:ride_uid]).exists?

      Ride.create!(uid: event.data[:ride_uid],
                   user_id: event.data[:user_id],
                   driver_id: event.data[:driver_id],
                   state: 'Draft')
    end
  end
end
