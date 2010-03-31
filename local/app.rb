require "lib/chimp"

helpers do
  def set_title(page)
    if page.respond_to?(:parent) && page.parent
      @title = "#{page.title} - #{page.parent.title}"
    else
      @title = "#{page.title} - #{Nesta::Configuration.title}"
    end
  end
end

# Action to subscribe users to our mailing list
post '/subscribe' do
  return '' if request.params['email'].empty?
  
  chimp = Chimp.new
  chimp.add(request.params['email'])
  return ''
end