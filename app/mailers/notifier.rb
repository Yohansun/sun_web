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

  def ask(user,current_user,content)
    @user = user
    @content = content
    mail(:to => "icolor@nipponpaint.com.cn",
         :subject => "对 #{@user.display_name} 的免费咨询",
         :body => "被咨询用户信息: #{@user.full_info}  \n咨询用户信息: #{current_user.full_info if current_user}  \n咨询内容：#{@content}"
        )
  end

  def cubit_fixture(id, designer_ids=nil, users_top500_present=nil)
    @cubit = CubitFixture.find(id)
    @area = Area.find(@cubit.area_id)
    @designers = User.where(id: designer_ids) if designer_ids
    #检测是否有同城设计师
    @users_top500_present = 1 if users_top500_present == 1
    mail(:to => %w{weiwei@nipponpaint.com.cn,jiwudan@nipponpaint.com.cn,bianyinting@nipponpaint.com.cn,sammizhou@nipponpaint.com.cn,yangjie@nipponpaint.com.cn},
         :subject => "装修预约需求更新#{'（无同城）' if @users_top500_present == 1 }")
  end

  def media(_media,arr)
    @media = _media
    @arr = arr
    mail(:to => @media.email,
         :subject => "[QA系统]" + Time.now.strftime("%y-%m-%d") + "通知",
         :reply_to => 'icolor@nipponpaint.com.cn'
        )
  end
end


