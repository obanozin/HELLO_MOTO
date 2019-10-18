class MessageTeam < ApplicationRecord
  after_create_commit { MessageTeamBroadcastJob.perform_later self }
end