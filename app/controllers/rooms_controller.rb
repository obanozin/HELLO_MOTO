class RoomsController < ApplicationController
	def index
		@rooms = Room.all.order(:id)
	end
	def create
		if Room.find(params[:id])
			redirect_to rooms_show_path(:id)
			else
	        @room = Room.create
	        @entry1 = Entry.create(:room_id => @room.id,:user_id => current_user.id)
	        @entry2 = Entry.create(:room_id => @room.id,:user_id => user.id)
	        redirect_to "/rooms/#{@room.id}"

    end

    def show
	    @room = Room.find(params[:id])
	    @messages = @room.messages
    end
end
