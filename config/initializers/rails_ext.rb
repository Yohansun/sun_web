module ActionView::Helpers::UrlHelper
	
  def link_to_with_title(name, options = {}, html_options = nil, &block)
  	unless name =~ /<img/
	    html_options = {:title => name} if html_options.nil?
	    html_options[:title] = name if html_options[:title].nil?
	end
    link_to_without_title(name, options, html_options, &block)
  end

  alias_method_chain :link_to, :title
end