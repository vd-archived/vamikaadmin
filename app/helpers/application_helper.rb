module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def email_regex
    return /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end
