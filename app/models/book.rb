class Book < ApplicationRecord

    has_one :genre
    has_one :book_detail, dependent: :destroy

    accepts_nested_attributes_for :book_detail, allow_destroy: true
    validates_associated :book_detail

    validates :book_name, :author_name, presence: true
    validates_with BookSequenceValidator

end
