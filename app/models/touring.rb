class Touring < ApplicationRecord
	belongs_to :user
	belongs_to :team
	attachment :touring_image
end
