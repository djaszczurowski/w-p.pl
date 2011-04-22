# encoding: utf-8
class Category < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 2
	set_primary_key :category_id
	has_many :news
end
