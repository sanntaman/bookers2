class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :name, uniqueness: true, length: { in: 1..6 }
         validates :introduction, length: { maximum: 50 }
         
         
  has_one_attached :image
  has_many :books, dependent: :destroy
end
