class Article < ActiveRecord::Base
	belongs_to :user
	validates :title,:user_id, :description, presence: true
	
end