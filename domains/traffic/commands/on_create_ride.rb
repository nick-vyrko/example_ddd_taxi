module Traffic
  module Commands
    class OnCreateRide
      include CommandHandler

      def call(command)
        with_aggregate(Ride, command.aggregate_id) do |ride|
          ride.create(command.user_id, command.driver_id)
        end
      end
    end
  end
end
