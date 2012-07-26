# -*- encoding : utf-8 -*-
class FaqsController < ApplicationController
  before_filter :find_user

  def index
    if @user
      @faqs = @user.faqs.page(params[:page]).per(5)

      render :template => "#{controller_name}/users/#{action_name}"
    else
      @faqs = Faq.page(params[:page]) || Faq.new
      @weekly_tips = WeeklyTip.page(1)
    end
  end

  def show
    @faq = Faq.find(params[:id]) || Faq.new
    @comments = @faq.comments.page params[:page]
  end

  def create
    @faq = current_user.faqs.create(params[:faq])
    if @faq.save
      current_user.create_score(current_user.id, 1001, 1, 10)
    else
      errors = ""
      @faq.errors.messages.each do |key, value|
        key = key.eql?(:title) ? "标题:" : "内容:"

        errors << "*" + key + value[0] + '\n'
      end 

      flash[:errors] = errors
    end

    redirect_to faqs_path
  end
end