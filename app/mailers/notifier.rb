# -*- encoding : utf-8 -*-
class Notifier < ActionMailer::Base
  default from: "icolor@nipponpaint.com.cn"

  def inform(user,content)
  	emails = "weiwei@nipponpaint.com.cn,SammiZhou@nipponpaint.com.cn,YangJie@nipponpaint.com.cn"
    @name = user.display_name
    @content = content

    case user.role.role
     when "designer"
      @role = "设计师(" + "#{user.des_status? ? '在职' : '在读'}" + ")"
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
    #email = user.email
    mail(:to => email,
         :subject => "Icolor本周之星",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end

  def rebuild(user)
    email = user.email
    @name = user.username
    if email && email != ''
      mail(:to => email,
           :subject => "iColor网站全新改版",
           :reply_to => 'icolor@nipponpaint.com.cn'
          )
    end
  end

  def week(email)
    mail(:to => email,
         :subject => "iColor网站全新改版",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end

  def email(email)
    mail(:to => email,
         :subject => "iColor网站全新改版",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end

  def notice(email)
    mail(:to => email,
         :subject => "iColor网站全新改版",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end
end
