class MessageTouring < ApplicationRecord
	after_create_commit { MessageTouringBroadcastJob.perform_later self }
	belongs_to :user
	belongs_to :touring
end
