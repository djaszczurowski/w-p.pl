# encoding: utf-8
class Category < ActiveRecord::Base
  cattr_reader :per_page
	set_primary_key :category_id
	has_many :news
end
