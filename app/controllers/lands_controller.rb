# -*- encoding : utf-8 -*-
class LandsController < ApplicationController
	def landing
		Land.create(:source => params[:source], :source_ip => request.remote_ip )

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
						"a963edmhuiyuanyoujian1"]

			if urls.include? params[:source]
				redirect_to home_refresh_path
			else	
				redirect_to root_path
			end
	end
end
