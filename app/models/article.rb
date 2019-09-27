class Article < ApplicationRecord
  paginates_per 5
  serialize :effect, Array
  belongs_to :user

  has_many_attached :images
  has_many :like_relation_ships, dependent: :delete_all
  has_many :users, through: :like_relation_ships

  has_many :comments, dependent: :delete_all
  has_many :user_comments, through: :comments, source: :user

  validates :content, presence: true

end
