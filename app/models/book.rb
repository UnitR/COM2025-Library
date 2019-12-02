class Book < ApplicationRecord
    has_one :genre
    has_one :book_detail, dependent: :destroy
    belongs_to :author
end
