class Gift < ActiveRecord::Base
   belongs_to :subject
   attr_accessible :gift_type, :gift_sub_type, :winner, :gift_name, :give_time, :published_at, :time

   attr_accessor :time
end
