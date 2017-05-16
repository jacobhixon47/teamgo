class Message < ApplicationRecord
  validates :content, :user_id, :channel_id, presence: true

  belongs_to :channel
  belongs_to :user
end
