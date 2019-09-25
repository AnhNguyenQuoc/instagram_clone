class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  before_create :set_avatar_default

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_many :like_relation_ships
  has_many :like_articles, through: :like_relation_ships, source: :article

  has_many :comments
  has_many :comments_articles, through: :comments, source: :article

  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :follower, through: :passive_relationships, source: :follower
  has_one_attached :avatar

  def follower_with(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  private

  def set_avatar_default
    avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images',
                                                'default-avatar.jpg')),
                  filename: 'default.jpg', content_type: 'image/jpg')
  end
end
