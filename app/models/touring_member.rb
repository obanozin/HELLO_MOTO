class TouringMember < ApplicationRecord
	belongs_to :user
	belongs_to :touring

	validates :user, uniqueness: { scope: :touring }

	def self.is_member?(touring, user)
		where(touring: touring, user: user ).any?
	end
end
