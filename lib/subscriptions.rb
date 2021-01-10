class Subscriptions
  def define(event_store, command_bus)
    event_store.subscribe(Rides::OnRideCreated, to: [Traffic::Events::RideCreated])

    command_bus.register(Traffic::Commands::CreateRide, Traffic::Commands::OnCreateRide.new)
  end
end
