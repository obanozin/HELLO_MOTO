class RoomTeamChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_team_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	MessageTeam.create! content: data['message']
  end
end
