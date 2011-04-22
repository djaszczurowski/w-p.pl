# encoding: utf-8
class Comment < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 2
  set_primary_key :comment_id
	belongs_to :user
	belongs_to :news
end
