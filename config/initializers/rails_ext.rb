module ActionView::Helpers::UrlHelper
	
  def link_to_with_title(name, options = {}, html_options = nil)
  	unless name =~ /<img/
	    html_options = {:title => name} if html_options.nil?
	    html_options[:title] = name if html_options[:title].nil?
	end
    link_to_without_title(name, options, html_options)
  end

  alias_method_chain :link_to, :title
end