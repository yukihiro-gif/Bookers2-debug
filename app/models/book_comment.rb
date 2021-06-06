class BookComment < ApplicationRecord
    belongs_to :book
    belongs_to :user

    validates :book_comments,presence: true
end
