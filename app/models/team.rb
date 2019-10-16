class Team < ApplicationRecord
	belongs_to :user
	attachment :team_image
end
