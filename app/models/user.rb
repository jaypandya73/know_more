class User < ActiveRecord::Base
validates :title, :description, presence: true
belongs_to :category
	
end
