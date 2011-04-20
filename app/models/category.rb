# encoding: utf-8
class Category < ActiveRecord::Base
	set_primary_key :category_id
	has_many :news
end
