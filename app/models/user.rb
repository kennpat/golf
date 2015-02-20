class User < ActiveRecord::Base
  has_many :rounds
  has_many :player_rounds
  has_many :rounds, through: :player_rounds
  has_many :courses
  has_many :tees
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
