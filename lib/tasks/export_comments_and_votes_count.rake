# -*- encoding: UTF-8 -*-
desc "导出评论，投票数据"
task :export_comments_and_votes_count => :environment  do

	start_time = ENV["start"]
	end_time = ENV["end"]

	CSV.open("#{Rails.root}/lib/data/export_data/#{Time.now.to_date}_comm_vote_info.csv", "wb") do |csv|
			csv << ['用户ID','姓名','邮箱', '角色', '评论数', '投票数']
			User.find_each do |user|
				csv << [user.id, user.display_name, user.email, user.role_chn_name, user.comments.where(:created_at => start_time..end_time).size, user.votes.where(:created_at => start_time..end_time).size]
			end
	end
end
