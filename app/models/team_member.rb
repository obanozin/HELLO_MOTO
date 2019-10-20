class TeamMember < ApplicationRecord

	enum is_team: { hold: 0, approval:1, bye:2}
	belongs_to :team
	belongs_to :user
	validates_uniqueness_of :user_id, scope: [:team_id]
	scope :approval, -> { where(is_team: :approval)}
end
