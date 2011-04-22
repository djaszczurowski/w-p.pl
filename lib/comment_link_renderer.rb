class CommentLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer

  

  protected

    def link_creator(text, page)
      # some magic code ;D
      page_link = link(text, page)
      part_size = 6 + text.to_s.length
      part1 = page_link.to_s.slice(0, page_link.length - part_size)
      part2 = page_link.to_s.slice(page_link.length - part_size, page_link.length - 1)
      page_link = part1 + "#comments_begin" + part2
      # let the magic work
    end


    def page_number(page)
      unless page == current_page        
        tag(:span, link_creator(page, page))
      else
        tag(:span, page, :class => "current")
      end
    end

    def previous_or_next_page(page, text, classname)
      if page
        tag(:span, link_creator(text, page), :class => classname)
      else
        tag(:span, text, :class => classname + ' disabled')
      end
    end

    def html_container(html)
      tag(:div, html, container_attributes)
    end

end
