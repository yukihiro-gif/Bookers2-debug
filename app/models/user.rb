class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments,dependent: :destroy

  has_many :relationships,class_name: "Relationship",  foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships,class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy
  has_many :followings, through: :relationships,source: :followed
  has_many :followers, through: :passive_relationships,source: :follower

  attachment :profile_image

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}


  def follow(user_id)
    unless self == user_id
      self.relationships.find_or_create_by(followed_id: user_id.to_i,follower_id: self.id)
    end
  end

  def unfollow(user_id)
      relationships.find_by(followed_id: user_id).destroy
  end


 def following?(user_id)
    followings.include?(user_id)
 end

end
