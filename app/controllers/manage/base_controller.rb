class Manage::BaseController < InheritedResources::Base
	layout :determine_layout
	before_filter :authenticate_admin!

private
  def determine_layout
    "manage"
  end

end
