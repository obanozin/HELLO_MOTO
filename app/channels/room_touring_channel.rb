class RoomTouringChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_touring_channel_#{params['room_touring']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	MessageTouring.create! content: data['message'], user_id: current_user.id, touring_id: params['room_touring']
  end
end