class RoomsController < ApplicationController
	def method_name
		@rooms = Room.all.order(:id)
	end
    def show
	    @room = Room.find(params[:id])
	    @messages = @room.messages
    end
end
