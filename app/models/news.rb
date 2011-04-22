# encoding: utf-8
class News < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 2
	set_primary_key :news_id
	has_many :comments
	belongs_to :user
	belongs_to :category
end
