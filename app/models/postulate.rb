# encoding: utf-8
class Postulate < ActiveRecord::Base
	set_primary_key :postulate_id
	belongs_to :user
end
