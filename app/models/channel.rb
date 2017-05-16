class Channel < ApplicationRecord
  validates :name, presence: true

  has_many :messages
  has_many :users, through: :messages
  belongs_to :team
end
