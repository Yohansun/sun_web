class SiteMessagesController < InheritedResources::Base
  def create
    create! do |succ, fail|
      succ.js { render 'success' }
      fail.js { render 'fail' }
    end
  end
end
