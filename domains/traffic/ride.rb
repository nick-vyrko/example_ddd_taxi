module Traffic
  class Ride
    include AggregateRoot

    AlreadyCreated = Class.new(StandardError)

    def initialize(id)
      @id = id
      @state = nil
    end

    def create(user_id, driver_id)
      raise AlreadyCreated if state != nil
      apply Events::RideCreated.new(data: { ride_uid: id, user_id: user_id, driver_id: driver_id })
    end

    on Events::RideCreated do |event|
      @user_id = event.data[:user_id]
      @driver_id = event.data[:driver_id]
      @state = Constants::DRAFT
    end

    private

    attr_reader :id, :state
  end
end
