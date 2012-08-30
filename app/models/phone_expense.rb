class PhoneExpense < ActiveRecord::Base
	belongs_to :user
  attr_accessible :register, :design, :vote, :comment, :share, :inspiration, :total, :user_id

  # def register
  # 	0 || self.register
  # end
end