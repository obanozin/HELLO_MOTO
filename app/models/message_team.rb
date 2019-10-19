class MessageTeam < ApplicationRecord
  after_create_commit { MessageTeamBroadcastJob.perform_later self }
  belongs_to :user
  belongs_to :team
end