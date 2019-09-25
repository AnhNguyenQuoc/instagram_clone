class Article < ApplicationRecord
  belongs_to :user

  has_many_attached :images
  has_many :like_relation_ships
  has_many :users, through: :like_relation_ships

  has_many :comments
  has_many :user_comments, through: :comments, source: :user

  validates :content, presence: true

end
