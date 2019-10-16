class TeamMember < ApplicationRecord

	enum team_member: { hold: 0, approval:1, bye:2}
	belongs_to :team
	belongs_to :user
end
