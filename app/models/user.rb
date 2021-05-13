class User < ApplicationRecord

  has_secure_password

  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "JoinTablePmRecipient"

  validates :email, 
    uniqueness: {message: "Email déjà utilisé"}, 
    presence: {message: "Email obligatoire"}
  validates :password,
    presence: {message: "Mot de passe obligatoire"}, 
    length: {minimum:6, maximum:20, message:"Le mot de passe doit faire entre 6 et 20 caractères"},
    confirmation: {message:"Mettre deux mots de passe identique"}
  validates :city_id,
    presence: {message: "La ville est obligatoire"}

  
end
