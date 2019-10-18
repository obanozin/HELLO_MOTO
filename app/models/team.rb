class Team < ApplicationRecord
	belongs_to :user
	attachment :team_image
	has_many :team_members
end
