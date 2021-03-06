class Post < ApplicationRecord
	has_many :comments

	validates :title, presence: { message: "Title must be present" }
	validates :post_body, presence: true
	validates :reading_time, presence: true
end