class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  has_many :likes, dependent: :destroy

  validates :content, presence: true
  validates :user_id, presence: true
  validates :gossip_id, presence: true
