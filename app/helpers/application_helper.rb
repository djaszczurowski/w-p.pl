module ApplicationHelper

	def title
		base_title = "NIE PODANO"
		if @title.nil?
			base_title		
		else
			@title
		end
	end
		
end
