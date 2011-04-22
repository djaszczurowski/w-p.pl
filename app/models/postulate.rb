# encoding: utf-8
class Postulate < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 2
	set_primary_key :postulate_id
	belongs_to :user
end
