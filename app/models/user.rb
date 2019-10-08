class User < ApplicationRecord

	belongs_to :prefecture, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


          enum sex: { man: 1, woman: 2 }


   
end
