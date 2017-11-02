class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 4 }
end
