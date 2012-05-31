# -*- encoding: utf-8 -*-
class YdaGamesController < ApplicationController

	def create
		if params[:read_all].eql? "on"
			@game = YdaGame.new(params[:yda_game])
			if @game.save
				render :js => "alert('报名成功，请继续上传作品');$('#box_layer').fadeOut();"
			else
				html = '请完善如下信息：\n'
				html << @game.errors.messages.values.join('\n')
				render :js => "alert('#{html.html_safe}');"
			end
		else
			render :js => "alert('请先阅读大赛的赛事细则！');"
		end
	end
end
