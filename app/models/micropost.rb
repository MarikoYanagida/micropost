class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255 }
  
  has_many :favorites
  has_many :favoritters, through: :favorites, source: :user
  has_many :reverse_of_favorite, class_name: 'Favorite', foreign_key: 'user_id'
  has_many :favoritings, through: :reverse_of_favorite, source: :micropost
  
end
