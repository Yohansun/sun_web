# -*- encoding : utf-8 -*-
class Skin < ActiveRecord::Base
	attr_accessible :skin_type_id, :user_ids, :skin_kv_upload_ids
	has_many :skin_kv_uploads

	SKIN_TYPE = {
		1 => "设计师",
		2 => "家装公司",
		3 => "普通用户",
		4 => "每周之星"
	}

	def skin_type
		SKIN_TYPE[skin_type_id]
	end

end