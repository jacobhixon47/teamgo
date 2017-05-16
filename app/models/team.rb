class Team < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :channels
  has_many :team_memberships
  has_many :users, :through => :team_memberships

end
