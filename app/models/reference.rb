class Reference < ApplicationRecord
	validates :author, presence: true
	validates :content, presence: true
	paginates_per 10
end
