# encoding: utf-8
module PurchaseHelper

	def status_text status
		result = case status
			when true
			    "通过"
			when false
			    "未通过"
			else
			    "待审核"
		end
		result
	end

	def status_css status
		result = case status
			when true
			    "record_pass"
			when false
			    "record_dispass"
			else
			    ""
		end
		result
	end

end
