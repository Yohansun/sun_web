# -*- encoding : utf-8 -*-
class Skin < ActiveRecord::Base
	attr_accessible :role_id, :user_ids, :skin_kv_upload_ids
	has_many :skin_kv_uploads

	ROLE_TYPE = {
		1 => "设计师",
		2 => "家装公司",
		3 => "普通用户"
	}

	def skin_type
		ROLE_TYPE[role_id]
	end	

end