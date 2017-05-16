class User < ApplicationRecord
  validates_uniqueness_of :username, :email
  validates :username, :email, :password, presence: true

  has_many :messages
  has_many :channels, through: :messages
  has_many :team_memberships
  has_many :teams, :through => :team_memberships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
