class Book < ApplicationRecord

	validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }

	belongs_to :user
	has_many :favorites, dependent: :destroy

  def favorited_by?(book)
     favorites.where(book_id: book.id).exists?
  end
end
