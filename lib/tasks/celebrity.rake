# -*- encoding : utf-8 -*-
require 'nokogiri'
require 'open-uri'

namespace :celebrity do
  desc '对化名人初始化数据'
  task :init_data => :environment do
    %w{ 空间设计 色彩设计 软装设计 园艺设计 装修施工 }.each do |name|
      CelebrityContentBoard.create name: name
    end
    DialogCelebrityPage.create
  end

  desc '首页对话名人初始化数据'
  task :init_home_data => :environment do
    home_dialog_celebrity = HomeDialogCelebrity.create
    3.times { home_dialog_celebrity.images.create }
  end

  desc '对话名人导入问题'
  task :import_celebrity_question => :environment do
    s = Roo::Excelx.new("#{Rails.root.to_s}/public/celebrity_questions.xlsx")
    s.each_with_index do |line,index|
      if index > 0
        question = CelebrityQuestion.new
        question.name = line[0]
        question.keyword  = line[1]
        question.content = line[2]
        question.celebrity_content_board_id = line[3].to_i
        question.fake_username = line[5]

        master = MasterProfile.where(:name => line[6]).first
        if master.present?
          question.master_profile_id = master.id
        end
        question.save
        question.update_attributes :created_at => line[4].to_s.gsub("/","-").to_time

        media = Media.where("name = ?",line[9]).first
        if media.present?
          reply = CelebrityQuestionReply.new
          reply.content = line[7]
          reply.media_id = media.id
          reply.celebrity_question_id = question.id
          reply.save
          reply.update_attributes :created_at => line[8]
          p "找到媒体" + media.name
        end
        p question.name + "保存成功"
      end
    end
  end

  desc 'qa系统短信'
  task :qa_send_message => :environment do
    Media.all.map do |media|
      boards = CelebrityContentBoard.where("id in (?)",media.boards.keys)
      arr = []
      str = ""
      boards.each do |board|
        questions = board.questions
        today_questions = questions.where("created_at >= ? and created_at <= ?",Date.current,Date.current.tomorrow)
        today_questions_count = today_questions.count
        today_replies_count = today_questions.sum{|n|n.replies.count}
        if today_questions_count > 0
          today_not_replied_count = today_replies_count - CelebrityQuestionReply.where("id in (?) and media_id is null",today_questions.map(&:id)).count
        else
          today_not_replied_count = 0
        end
        if questions.count > 0
          total_not_replied_count = questions.count - CelebrityQuestionReply.where("id in (?) and media_id is not null",questions.map(&:id)).count
        else
          total_not_replied_count = 0
        end
        arr << [board.name,today_questions_count,today_not_replied_count,total_not_replied_count]
        str += "[#{board.name}]今天还有#{total_not_replied_count}条问题没有回复；"
      end
      if boards.count > 0
        Notifier.media(media,arr).deliver!
        msg = "[QA系统]" + Time.now.strftime("%y-%m-%d") + "通知："+str
        SmsCubit.new(msg,media.mobile).transmit
      end
    end
  end
end