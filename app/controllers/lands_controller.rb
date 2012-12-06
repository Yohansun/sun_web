# -*- encoding : utf-8 -*-
class LandsController < ApplicationController
	def landing
		# Land.create(:source => params[:source], :source_ip => request.remote_ip )

		Rails.logger.info "landing: #{params[:source]}, #{request.remote_ip}"

		urls = ["taipingyangshouye1",
						"taipingyangketingpingdao1",
						"taipingyangwoshipingdao1",
						"taipingyangertongfangpingdao1",
						"taipingyangsecaidapei1",
						"a963shouyedingbu1",
						"a963shouyejiaodian1",
						"a963shouyedidiyiping1", "a963shouyeredian1",
						"a963shouyemingrenzhuanfang1", "a963shejishitongdao1",
						"a963zixunzhongxinjiaodianxinwen1", "taipingyangjiajuyixingguanggaowei1",
						"a963edmhuiyuanyoujian1",
						"a963shouyedingbu2",
						"a963shouyejiaodian2",
						"a963shouyedidiyiping2",
						"a963shouyeredian2",
						"a963shouyemingrenzhuanfang2",
						"a963shejishitongdao2",
						"a963zixunzhongxinjiaodianxinwen2",
						"a963edmhuiyuanyoujian2"]

			urls2 =["80018ketingpingdao2",
							"80018shouyetupian2",
							"80018woshipingdao2"]

			if urls.include? params[:source]
				redirect_to home_refresh_path
			elsif urls2.include? params[:source]
				redirect_to other_events_review_path
			else
				redirect_to root_path
			end
	end
end
