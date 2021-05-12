class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  has_many :likes, dependent: :destroy

  validates :content,
    presence: {message:"Le contenu est obligatoire"},
    length:   {minimum: 2, message:"Le commentaire doit faire minimum 2 caractères"}
  validates :user_id, presence: true
  validates :gossip_id, presence: true
  
end