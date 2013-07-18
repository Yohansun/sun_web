class Manage::BaseController < InheritedResources::Base
	layout "manage"
	before_filter :authenticate_admin!
end
