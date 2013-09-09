class ChannelTip < ActiveRecord::Base
  attr_accessible :title, :rank, :content, :link, :admin_id
end
