class RoomsController < ApplicationController
	def index
		@rooms = Room.all.order(:id)
	end
	def create
        @room = Room.new
    end

    def show
	    @room = Room.find(params[:id])
	    @messages = @room.messages
    end
end
