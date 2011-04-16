class Comment < ActiveRecord::Base
  set_primary_key :comment_id
	belongs_to :user
	belongs_to :news
end
