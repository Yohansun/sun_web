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
							"souhu_jiajushouye",
							"souhu_jiajushejishi",
							"souhu_tuliaopindao",
							"souhu_xinwenzhongxin",
							"souhu_bendixinwen",
							"80018_wangyouyangbanjian_neiyeyouce",
							"souhu_zhuangxiuzongluntantiezizhidingqu",
							#20130428story_605
							"428_sina_tk1",
							"428_sina_tk3",
							"428_sina_tk4",
							"428_taipingyang_tk3",
							"428_taipingyang_tk4",
							"428_pipawang_tk2",
							"428_pipawang_tk3"
						]

			urls_baicheng = ["baicheng_soufun_tuliao",
							"baicheng_soufun_news",
							"baicheng_soufun_bbs",
							"baicheng_soufun_beijing",
							"baicheng_soufun_shanghai",
							"baicheng_soufun_guangzhou",
							"baicheng_soufun_shenzhen",
							"baicheng_soufun_tianjing",
							"baicheng_soufun_chongqing",
							"baicheng_soufun_chengdu",
							"baicheng_soufun_wuhan",
							"baicheng_soufun_hangzhou",
							"baicheng_soufun_shijiazhuang",
							"baicheng_soufun_xiaoqu",
							"baicheng_souhu_homepage",
							"baicheng_souhu_homepage_rectangle",
							"baicheng_souhu_designer_right",
							"baicheng_souhu_tuliao_left",
							"baicheng_souhu_news_left",
							"baicheng_souhu_news_first_link",
							"baicheng_hejia_home_three",
							"baicheng_hejia_painting_channel",
							"baicheng_hejia_jushang",
							"baicheng_hejia_tuwenzixun",
							"baicheng_zhuangxiu_colors",
							"baicheng_zhuangxiu_formats",
							"baicheng_zhuangxiu_designers",
							#20130428story_605
							"428_sina_baicheng1",
							"428_sina_baicheng2",
							"428_sina_baicheng3",
							"428_sina_baicheng4",
							"428_sina_baicheng5",
							"428_taipingyang_baicheng1",
							"428_taipingyang_baicheng2",
							"428_taipingyang_baicheng3",
							"428_taipingyang_baicheng4",
							"428_soufang_baicheng1",
							"428_soufang_baicheng2",
							"428_soufang_baicheng3",
							"428_soufang_baicheng4",
							"428_soufang_baicheng5",
							"428_soufang_baicheng6",
							"428_soufang_baicheng7",
							"428_soufang_baicheng8",
							"428_soufang_baicheng9",
							"428_soufang_baicheng10",
							"428_soufang_baicheng11",
							"428_soufang_baicheng12",
							"428_soufang_baicheng13",
							"428_soufang_baicheng14",
							"428_souhujiaodian_baicheng1",
							"428_souhujiaodian_baicheng2",
							"428_souhujiaodian_baicheng3",
							"428_souhujiaodian_baicheng4",
							"428_souhujiaodian_baicheng5",
							"428_souhujiaodian_baicheng6",
							"428_souhujiaodian_baicheng7",
							"428_souhujiaodian_baicheng8",
							"428_souhujiaodian_baicheng9",
							"428_hejia_baicheng1",
							"428_hejia_baicheng2",
							"428_hejia_baicheng3",
							"428_hejia_baicheng4",
							"428_zhuangxiudianpin_baicheng1",
							"428_zhuangxiudianpin_baicheng2",
							"428_zhuangxiudianpin_baicheng3",
							"428_zhuangxiudianpin_baicheng4",
							"428_zhuangxiudianpin_baicheng5",
							"428_pipawang_baicheng1",
							"428_pipawang_baicheng2",
							"428_pipawang_baicheng3",
							"509_soufang_love_1",
							"509_soufang_love_2",
							"509_soufang_love_3",
							"509_soufang_love_4",
							"509_soufang_love_5",
							"509_soufang_love_6",
							"509_soufang_love_7",
							"509_soufang_love_8",
							"509_soufang_love_9",
							"509_soufang_love_10",
							"509_soufang_love_11",
							"509_souhu_love_1",
							"509_souhu_love_2",
							"509_souhu_love_3",
							"509_souhu_love_4",
							"509_souhu_love_5",
							"509_souhu_love_6",
							"509_yichuanmei_love_1"
						]

			urls_color_designs = ["428_sina_color1",
				"428_sina_color2",
				"428_sina_color4",
				"428_taipingyang_color2",
				"428_taipingyang_color3",
				"428_soufang_color1",
				"428_soufang_color2",
				"428_soufang_color3",
				"428_soufang_color4",
				"428_soufang_color5",
				"428_soufang_color6",
				"428_soufang_color7",
				"428_soufang_color8",
				"428_soufang_color9",
				"428_soufang_color10",
				"428_soufang_color11",
				"428_soufang_color12",
				"428_soufang_color13",
				"428_soufang_color14",
				"428_souhujiaodian_color1",
				"428_souhujiaodian_color2",
				"428_souhujiaodian_color3",
				"428_souhujiaodian_color4",
				"428_souhujiaodian_color5",
				"428_souhujiaodian_color6",
				"428_souhujiaodian_color7",
				"428_souhujiaodian_color8",
				"428_souhujiaodian_color9",
				"428_hejia_color1",
				"428_hejia_color2",
				"428_hejia_color3",
				"428_zhuangxiudianpin_color1",
				"428_zhuangxiudianpin_color2",
				"428_zhuangxiudianpin_color3",
				"428_zhuangxiudianpin_color4"
			]
			urls_master_designs = ["428_sina_m_design1",
				"428_sina_m_design4",
				"428_taipingyang_m_design1",
				"428_taipingyang_m_design2",
				"428_taipingyang_m_design3",
				"428_taipingyang_m_design4",
				"428_souhujiaodian_m_design1",
				"428_souhujiaodian_m_design2",
				"428_souhujiaodian_m_design3",
				"428_souhujiaodian_m_design4",
				"428_souhujiaodian_m_design5",
				"428_souhujiaodian_m_design6",
				"428_souhujiaodian_m_design7",
				"428_souhujiaodian_m_design8",
				"428_souhujiaodian_m_design9",
				"428_hejia_m_design1",
				"428_hejia_m_design3",
				"428_hejia_m_design4",
				"428_zhuangxiudianpin_m_design1",
				"428_zhuangxiudianpin_m_design4",
				"428_pipawang_m_design1",
				"428_pipawang_m_design2",
				"428_pipawang_m_design3"]

			#0327重新新加的监测
			urls_design_imgs = ["327_soufang1",
							"327_soufang2",
							"327_soufang3",
							"327_soufang4",
							"327_soufang5",
							"327_soufang6",
							"327_soufang7",
							"327_soufang8",
							"327_soufang9",
							"327_soufang10",
							"327_soufang11",
							"327_soufang12",
							"327_soufang13",
							"327_soufang14",
							"327_hejia1",
							"327_hejia2",
							"327_hejia3",
							"327_hejia4",
							"dianpingwang_shouyetupianlunbo",
							"327_zhuangxiudianpin1",
							"327_zhuangxiudianpin2",
							"327_zhuangxiudianpin3",
							"pipa_shouyezhtizhuangxiu"
			]

			urls_channel_access = [
							"souhu_jiajushouyedaogoubangshou",
							"souhu_jiajubeijingyemiandaogoubangshou",
							"327_soufang_ck1",
							"327_soufang_ck2",
							"327_soufang_ck3",
							"327_soufang_ck4",
							"327_soufang_ck5",
							"327_soufang_ck6",
							"327_soufang_ck7",
							"327_soufang_ck8",
							"327_soufang_ck9",
							"327_soufang_ck10",
							"327_soufang_ck11",
							"327_soufang_ck12",
							"327_soufang_ck13",
							"327_soufang_ck14",
							"327_souhujiaodian_kc1",
							"327_souhujiaodian_kc2",
							"327_souhujiaodian_kc3",
							"327_souhujiaodian_kc4",
							"327_souhujiaodian_kc5",
							"327_souhujiaodian_kc6",
							"327_hejia_kc1",
							"327_hejia_kc2",
							"327_hejia_kc3",
							"327_hejia_kc4",
							"dianpingwang_shouyetupianlunbo2",
							"327_zhuangxiudianpin_kc1",
							"327_zhuangxiudianpin_kc2",
							"327_zhuangxiudianpin_kc3",
							"pipa_shouyezhtizhuangxiu2",
							#20130428story_605
							"428_sina_ck1",
							"428_sina_ck4",
							"428_sina_ck5",
							"428_taipingyang_ck1",
							"428_taipingyang_ck3",
							"428_taipingyang_ck4",
							"428_pipawang_ck2",
							"428_pipawang_ck3"
						]
			#TASK 458
			urls_star = ["327_hejia_star1",
				"327_hejia_star3",
				"327_zhuangxiudianpin_star1",
				"327_zhuangxiudianpin_star3",
				#20130428story_605
				"428_sina_star1",
				"428_sina_star4",
				"428_taipingyang_star3",
				"428_hejia_star1",
				"428_hejia_star3",
				"428_zhuangxiudianpin_star2",
				"428_zhuangxiudianpin_star3",
				"428_zhuangxiudianpin_star4"
			]


	 		redirect_to redirect_to_url = if urls.include? params[:source]
				home_refresh_path
			elsif urls2.include? params[:source]
				other_events_review_path
			elsif urls3.include? params[:source]
				root_path
			elsif urls4.include? params[:source]
				gift_list_path
			elsif urls_design_images.include? params[:source]
				images_path
			elsif urls_baicheng.include? params[:source]
				baicheng_root_path
			elsif urls_channel_access.include? params[:source]
				channel_access_path
			elsif urls_design_imgs.include? params[:source]
				images_path
			elsif urls_star.include? params[:source]
				weekly_stars_path
			elsif urls_color_designs.include? params[:source]
				color_designs_path
			elsif urls_master_designs.include? params[:source]
				master_interviews_path
			else
				root_path
			end
	end
end
