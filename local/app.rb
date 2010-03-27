helpers do
  def set_title(page)
    if page.respond_to?(:parent) && page.parent
      @title = "#{page.title} - #{parent.title}"
    else
      @title = "#{page.title} - #{Nesta::Configuration.title}"
    end
  end
end