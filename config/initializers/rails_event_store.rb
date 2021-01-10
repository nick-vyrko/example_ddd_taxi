Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new
  Rails.configuration.command_bus = Arkency::CommandBus.new

  Subscriptions.new.define(Rails.configuration.event_store, Rails.configuration.command_bus)
end
