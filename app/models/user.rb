class User < ApplicationRecord
  has_secure_password

  has_many :players
  has_many :characters, through: :players
  has_many :games, through: :players

  validates :username, presence: true, uniqueness: true
  validates :password,  format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/
, message: "Le mot depasse doit faire minimum 8 caractères et contenir au moins, une majuscule, une minuscule, un caractère spécial et un nombre." }

end
