class News < ActiveRecord::Base
	set_primary_key :news_id
	belongs_to :user
end
