class Team < ApplicationRecord
	belongs_to :user
	attachment :team_image
	has_many :team_members, dependent: :destroy
	has_many :message_teams, dependent: :destroy
	has_many :tourings

	validates :team_name,    length: { minimum: 1 }
	validates :team_name,    length: { maximum: 20 }
	validates :team_introduction,    length: { maximum: 200 }
end
