# -*- encoding: utf-8 -*-

require 'spreadsheet'
desc "excel表格中的所有作品链接地址"
task :check_user_design => :environment  do
  tmp = []
  Spreadsheet.client_encoding ="UTF-8"
  image_id = []
  book = Spreadsheet.open "#{Rails.root}/lib/data/check-user-design.xls"
  sheet1 = book.worksheet 0
  sheet1.each do |row|
    if row[4].present?
      user = User.find_by_username(row[4])
      p user
      if user
        designs = Design.where(user_id: user.id)
        designs.each do |design|
          tmp << "#{row[4]} http://www.icolor.com.cn/users/#{user.id}/designs/#{design.id}"
        end
      end
    end
  end
  CSV.open("#{Rails.root}/lib/data/check_user_design.csv", 'wb') do |csv|
    tmp.each {|f| csv << [f]}
  end
end

task :check_user_design2 => :environment  do
  tmp = []
  Spreadsheet.client_encoding ="UTF-8"
  image_id = []
  book = Spreadsheet.open "#{Rails.root}/lib/data/cehck_design_url.xls"
  sheet1 = book.worksheet 0
  sheet1.each do |row|
    if row[1].present?
      users = User.where("name = ? or username = ?",row[1],row[1])
      if users.present?
        user_id = users.first.id
        if row[2]
          designs = Design.where("title = ? and user_id = ?",row[2],user_id)
        else
          designs = Design.where("user_id = ?",user_id)
        end
        if designs.present?
          designs.each do |design|
            tmp << "#{row[1]} #{row[2]} http://www.icolor.com.cn/users/#{user_id}/designs/#{design.id}"
          end
        end
      end
    end
  end
  CSV.open("#{Rails.root}/lib/data/check_user_design.csv", 'wb') do |csv|
    tmp.each {|f| csv << [f]}
  end
end

