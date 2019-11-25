class User < ApplicationRecord

	belongs_to :prefecture, optional: true
	has_many :moto_infos
	attachment :profile_image
	has_many :messages
	has_many :entries
	has_many :teams
	has_many :team_members
	has_many :message_teams
	has_many :tourings
	has_many :touring_members
	has_many :message_tourings
	validates :prefecture_id, presence: true

    validates :nickname,    length: { minimum: 1 }
    validates :nickname,    length: { maximum: 16 }
    validates :user_name,    length: { minimum: 1 }
    validates :user_name,    length: { maximum: 16 }
    validates :user_introduction,    length: { maximum: 100 }



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


          enum sex: { man: 1, woman: 2, other: 3}
end
