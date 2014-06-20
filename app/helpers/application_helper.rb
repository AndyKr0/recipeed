module ApplicationHelper

  #Returns page title, or sometimes, it doesn't. On purpose.
  def full_title(page_title)
    base_title = "Recipeed"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
