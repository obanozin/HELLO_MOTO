class MessageTouringBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_touring_channel#{message.touring_id}", message: render_message(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(message)
    end
end

