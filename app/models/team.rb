class Team < ApplicationRecord
	belongs_to :user
	attachment :team_image
	has_many :team_members
	has_many :message_teams
	has_many :tourings
end
