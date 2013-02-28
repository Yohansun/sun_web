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
						"a963shouyedidiyiping1", 
						"a963shouyemingrenzhuanfang1", 
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

			urls3 =["80018secaidapei2",
							"pchousebankuaidingzhi2",
							"pchousebankuaidingzhi-2",
						  "souhu_jiajushouye",
							"souhu_jiajushejishi",
							"souhu_tuliaopindao",
							"souhu_xinwenzhongxin",
							"souhu_bendixinwen",
							"hejia_shouye",
							"hejia_youqituliaohangye",
							"hejia_jushangzhongduan",
							"hejia_tuwenzixunzhongduan",
							"80018_secaidapei_neiyeyouce",
							"80018_shejishi_neiyeyouce"]

			urls4 = ["a963shouyejiaodian1","a963shouyeredian1","a963shejishitongdao1"]

			urls_design_images = [
							"soufang_quanguo_pinpai",
							"soufang_xinwen_pinpai",
							"soufang_pinpailuntan_zhutie",
							"soufang_beijin_shouye",
							"soufang_shanghai_shouye",
							"soufang_guangzhou_shouye",
							"soufang_shenzheng_shouye",
							"soufang_tianjing_shouye",
							"soufang_chongqing_shouye",
							"soufang_chengdu_shouye",
							"soufang_wuhan_shouye",
							"soufang_hangzhou_shouye",
							"soufang_shijiazhuang_shouye",
							"soufang_xiaoquwang_pinpaizhanshi",
							"souhu_zhuangxiudaxue_shouye",
							"80018_wangyouyangbanjian_neiyeyouce"]

			if urls.include? params[:source]
				redirect_to home_refresh_path
			elsif urls2.include? params[:source]
				redirect_to other_events_review_path
			elsif urls3.include? params[:source]
				redirect_to root_path
			elsif urls4.include? params[:source]
				redirect_to gift_list_path
			elsif urls_design_images.include? params[:source]
				redirect_to design_images_path
			else
				redirect_to root_path
			end
	end
end
