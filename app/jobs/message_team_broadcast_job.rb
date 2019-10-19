class MessageTeamBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_team_channel_#{message.team_id}", message: render_message(message)
  end
    private
    def render_message(message)
      ApplicationController.renderer.render(message)
    end
end
