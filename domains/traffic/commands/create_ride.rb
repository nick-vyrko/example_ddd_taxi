module Traffic
  module Commands
    class CreateRide < Command
      attribute :ride_uid, Types::UUID
      attribute :user_id, Types::Coercible::Integer
      attribute :driver_id, Types::Coercible::Integer

      alias :aggregate_id :ride_uid
    end
  end
end
