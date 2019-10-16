class RoomsController < ApplicationController
	def index
		@rooms = Room.all.order(:id)
	end
	def create
		entries1 = Entry.where("user_id = ? ",current_user.id)
		entries2 = Entry.where("user_id = ? ",params[:user_id])
		entries1.each do|entry1|
			entries2.each do |entry2|
				if entry1.room_id == entry2.room_id
                  redirect_to room_path(entry1.room_id)
                  return
				end
			end
		end
	        @room = Room.create
	        @entry1 = Entry.create(:room_id => @room.id,:user_id => current_user.id)
	        @entry2 = Entry.create(:room_id => @room.id,:user_id => params[:user_id])
	        redirect_to room_path(@room.id)
	        return

    end

    def show
    	entries_cnt = Entry.where("user_id = ? and room_id = ? ",current_user.id ,params[:id]).count
    	if entries_cnt == 1
	    @room = Room.find(params[:id])
	    @messages = @room.messages
	    else
	    redirect_to user_path(current_user)
	    end
    end
end
