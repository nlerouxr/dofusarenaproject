class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password,  format: { with: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/, message: "Le mot depasse doit faire minimum 8 caractères et contenir au moins, une majuscule, une minuscule, un caractère spécial et un nombre." },
end
