module Traffic
  module Events
    class RideCreated < Event
      attribute :ride_uid, Types::UUID
      attribute :user_id, Types::ID
      attribute :driver_id, Types::ID
    end
  end
end
