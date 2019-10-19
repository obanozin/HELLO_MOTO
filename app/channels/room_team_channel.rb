class RoomTeamChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_team_channel_#{params['room_team']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	MessageTeam.create! content: data['message'], user_id: current_user.id, team_id: params['room_team']
  end
end
