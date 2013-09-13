# encoding: utf-8

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

  def cubit_fixture(id)
    @cubit = CubitFixture.find(id)
    #sammizhou@nipponpaint.com.cn,WeiWei@nipponpaint.com.cn,YangJie@nipponpaint.com.cn
    @area = Area.find(@cubit.area_id)
    mail(:to => %w{sammizhou@nipponpaint.com.cn,WeiWei@nipponpaint.com.cn,YangJie@nipponpaint.com.cn},
         :subject => "装修丘比特_#{Time.now.strftime("%Y%m%d%H%M")}",
         :body => "姓名：#{@cubit.name} \n电话：#{@cubit.phone} \n装修面积：#{@cubit.fixture_area} \n期待风格：#{@cubit.style} \n楼盘名称:#{@cubit.house_name}\n\n房型:#{@cubit.fixture_type}\n装修所在地:#{@area.parent.name}#{@area.name}\n装修预算:#{@cubit.pre_price}\n表单提交时间:#{Time.now.strftime("%Y.%m.%d %H:%M")}\n"
        )
  end
end
