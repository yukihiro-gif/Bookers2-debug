class Book < ApplicationRecord

	validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }

	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments,dependent: :destroy

  def favorited_by?(user)
     favorites.where(user_id: user.id).exists?
  end

  def self.search(method,word)
    if method == "perfect_method"
        @books = Book.where(title: word)
    elsif method == "partial_method"
        @books = Book.where("title LIKE?","%#{word}%")
    elsif method == "forward_method"
        @books = Book.where("title LIKE?","#{word}%")
    elsif method == "backward_method"
       @books = Book.where("title LIKE?","%#{word}")
    else
       Book.all
    end
  end


end
