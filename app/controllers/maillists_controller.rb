class MaillistsController < InheritedResources::Base
  def create
    create! do |succ, fail|
      @valid_result = resource.errors.messages[:email][0]
      succ.js { render 'success' }
      fail.js { render 'fail', :locals => { :v => @valid_result } }
    end
  end
end