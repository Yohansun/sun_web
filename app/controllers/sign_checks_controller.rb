# -*- encoding : utf-8 -*-
class SignChecksController < ApplicationController

  def index
    if Time.now.strftime("%Y%m%d").to_i > Time.local(2014,2,9).strftime("%Y%m%d").to_i
      redirect_to root_path
    end
  end

  def check_in
    @date_today = Time.now.strftime('%Y-%m-%d').split('-').join().to_i
    @is_check_today = SignCheck.where(user_id: current_user.id, date_at: @date_today)
    @is_prize = SignCheck.where(user_id: current_user.id, prize: true)
    sign_check_words = ['马年大吉喜气扬,马头扬扬好运来,<br/>祝您马年如意,事事顺心!','马年到来鞭炮闹,红妆对联也娇俏,<br />迎春花儿悄然笑,祝福声声不停消!','马年带着喜庆来,祝福伴着开心到,<br />祝您吉祥之年事事如意,步步高升!','金马狂舞迎春祥,瑞雪喜降兆丰年,<br /马年纳财富满堂,喜悦快乐体健康','神龙舞空去，金马祥云来，<br />祝您马年多财气，旺马载运福满天！']
    if @is_check_today.blank?
      if @is_prize.blank?
        aa = rand(0..10)
        if aa > 5
          SignCheck.create(user_id: current_user.id, prize: true,date_at: @date_today)
          render js: "$('#winning').modal();" and return
        else
          SignCheck.create(user_id: current_user.id, date_at: @date_today)
          @sign_check_word = sign_check_words.sample
          render :check_in and return
        end
      else
        render js: "$('#unwinning').modal();" and return
      end
    else
      render js: "alert('今天你已经签到过了,明天再来试试手气哟!');"
    end

  end
end
