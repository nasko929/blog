class Emoji < ApplicationRecord
	has_many :likes, dependent: :destroy
end
