desc "reload site_messages and sys_msgs"
task :reload_site_messages_and_sys_msgs => :environment do
	SiteMessage.find_each do |smt|
		unless smt.sys_msg_id.blank?
			puts "site_message=======id %s " % smt.id

			@sysmsg = SysMsg.find_by_id(smt.sys_msg_id)
			if @sysmsg
				@sysmsg.update_attribute("site_message_id", smt.id)
			end
		end
	end
end
