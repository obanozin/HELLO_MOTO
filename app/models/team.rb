class Team < ApplicationRecord
	belongs_to :user
	attachment :team_image
	has_many :team_members, dependent: :destroy
	has_many :message_teams, dependent: :destroy
	has_many :tourings
end
