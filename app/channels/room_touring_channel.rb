class RoomTouringChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_touring_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
  	ActionCable.server.broadcast 'room_touring_channel', message: data['message']
  end
end
