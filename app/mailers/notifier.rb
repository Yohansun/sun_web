# -*- encoding : utf-8 -*-
class Notifier < ActionMailer::Base
  default from: "icolor@nipponpaint.com.cn"

  def inform(user,content)
  	emails = "weiwei@nipponpaint.com.cn,SammiZhou@nipponpaint.com.cn,YangJie@nipponpaint.com.cn"
    @name = user.display_name
    @content = content

    case user.role.role
     when "designer"
      @role = "设计师(" + "#{user.des_status? ? '在读' : '在职'}" + ")"
     when "company"
      @role = "家装公司" 
     else 
      @role = "普通用户"
    end
    
    @path = user_url(user)
       
  	mail(:to => emails,
         :subject => "#{user.display_name}发来的在线咨询",
         :reply_to => 'icolor@nipponpaint.com.cn'
         )
  end

  def this_week(email)
    mail(:to => email,
         :subject => "iColor本周设计之星出炉啦！",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end

  def rebuild(user)
    @user = user
    mail(:to => @user.email,
         :subject => "iColor全新改版，最新精彩内容抢先看哦~",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end

  def week(user)
    @user = user
    mail(:to => @user.email,
         :subject => "您有一周没来iColor了，快来看看吧~",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end

  def email(email,name)
    @email = email
    @name = name
    mail(:to => @email,
         :subject => "iColor月月有礼，名利双收",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end

  def notice(email)
    mail(:to => email,
         :subject => "恭喜您！您的作品【春色满屋】被评选为本周设计之星啦！",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end

  def ask(user,content)
    @user = user
    @content = content
    mail(:to => "501225658@qq.com",
         :subject => "来自#{@user.display_name}的免费咨询",
         :body => "用户咨询：#{@content}"
        )
  end
end
