class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_table_tag_gossips
  has_many :tags, through: :join_table_tag_gossips, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, 
    presence: {message:"Le titre est obligatoire"}, 
    length:   {minimum: 2,maximum: 20, message:"Le titre doit faire entre 2 et 20 caractères"}
    
  validates :content,
    presence: {message:"Le potin est obligatoire"},
    length:   {minimum: 10, message:"Le potin doit faire minimum 10 caractères"}
end
