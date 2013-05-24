diff --git a/app/assets/images/reco2013-title.jpg b/app/assets/images/reco2013-title.jpg
deleted file mode 100644
index 21f18ff..0000000
Binary files a/app/assets/images/reco2013-title.jpg and /dev/null differ
diff --git a/app/assets/images/reco2013.jpg b/app/assets/images/reco2013.jpg
deleted file mode 100644
index b28a7ee..0000000
Binary files a/app/assets/images/reco2013.jpg and /dev/null differ
diff --git a/app/assets/images/step2-model.jpg b/app/assets/images/step2-model.jpg
deleted file mode 100644
index eef7bfb..0000000
Binary files a/app/assets/images/step2-model.jpg and /dev/null differ
diff --git a/app/assets/images/winner/winner-bg.jpg b/app/assets/images/winner/winner-bg.jpg
deleted file mode 100644
index 73a6bc3..0000000
Binary files a/app/assets/images/winner/winner-bg.jpg and /dev/null differ
diff --git a/app/assets/images/winner/winner-bg2.png b/app/assets/images/winner/winner-bg2.png
deleted file mode 100644
index 9054b14..0000000
Binary files a/app/assets/images/winner/winner-bg2.png and /dev/null differ
diff --git a/app/assets/images/winner/winner-bullets.gif b/app/assets/images/winner/winner-bullets.gif
deleted file mode 100644
index a6f30b9..0000000
Binary files a/app/assets/images/winner/winner-bullets.gif and /dev/null differ
diff --git a/app/assets/images/winner/winner-bullets.png b/app/assets/images/winner/winner-bullets.png
deleted file mode 100644
index bee14ef..0000000
Binary files a/app/assets/images/winner/winner-bullets.png and /dev/null differ
diff --git a/app/assets/images/winner/winner-hd.png b/app/assets/images/winner/winner-hd.png
deleted file mode 100644
index a2c94b4..0000000
Binary files a/app/assets/images/winner/winner-hd.png and /dev/null differ
diff --git a/app/assets/javascripts/2013main.js b/app/assets/javascripts/2013main.js
index 52f005e..631014d 100755
--- a/app/assets/javascripts/2013main.js
+++ b/app/assets/javascripts/2013main.js
@@ -137,15 +137,4 @@
           $(this).parents('form').find('textarea').css('color', color_value);
       });
   })($);
-  // lazyload 
-  (function($){ 
-  	if($.fn.lazyload){
-  		$(".kv2013_slider img").lazyload({ 
-  			event : "slide"
-  			}).eq(0).trigger('slide').end().eq(1).trigger('slide'); 
-  		$('.wrapper img').add('.imap img').add('.footer img').lazyload({
-  			effect : 'fadeIn' 
-  			}); 
-  	}
-  })($); 
 });/*$*/
\ No newline at end of file
diff --git a/app/assets/javascripts/design_images.js b/app/assets/javascripts/design_images.js
index b89ba82..15c447d 100644
--- a/app/assets/javascripts/design_images.js
+++ b/app/assets/javascripts/design_images.js
@@ -185,5 +185,5 @@ function refresh_search(params) {
     page = '0'
   }
 
-  window.location = "/images/" + tags + imageable_type + "-" + ranking_list + "-" + area_id + "-" + pinyin + "-" + search + "-" + all_tags + "-" + "0";
+  window.location = "/images/" + tags + imageable_type + "-" + ranking_list + "-" + area_id + "-" + pinyin + "-" + search + "-" + all_tags + "-" + "0/0";
 }
diff --git a/app/assets/javascripts/magic_content/image_library.js.coffee b/app/assets/javascripts/magic_content/image_library.js.coffee
index d864de8..a2fd41a 100644
--- a/app/assets/javascripts/magic_content/image_library.js.coffee
+++ b/app/assets/javascripts/magic_content/image_library.js.coffee
@@ -84,7 +84,7 @@ class ImageLibrary
       dom = $(event.currentTarget)
       tag_id = dom.data('tag-id')
       $('.js-tab-'+tag_id+'-childen').toggleClass('expand')
-      if tag_id is 136 || tag_id is 210 || tag_id is 366
+      if tag_id is 136 || tag_id is 210
         if dom.hasClass('expand')
           dom.removeClass('expand')
           dom.html('收缩')
diff --git a/app/assets/stylesheets/2013upload.css.erb b/app/assets/stylesheets/2013upload.css.erb
index 16d43b7..b1b873d 100755
--- a/app/assets/stylesheets/2013upload.css.erb
+++ b/app/assets/stylesheets/2013upload.css.erb
@@ -32,39 +32,10 @@
 .upload_edit2013 .work_info2013{margin-left:250px;}
 .upload_edit2013 .label2013{margin:0 15px;}
 .upload_edit2013 .control2013{float:left;width:770px;min-height:30px;margin-bottom:10px;}
-/*.upload_edit2013 .control2013 .upload2013_toggle div{display:none;}*/
+.upload_edit2013 .control2013 .upload2013_toggle div{display:none;}
 .upload_edit2013 .control2013 div.fl{width:610px;margin-top:8px;}
 .upload_edit2013 .control2013 input{height:auto;font-size:12px;color:#333;padding:3px;}
 .upload_edit2013 .control2013 .help-text{margin:9px 0;}
-
-.control2013-tips p{border-top:1px dotted #b4b4b4;padding-top:15px;font:bold 12px 'Simsun';color:#c00;text-indent:80px;}
-.reco2013-bin{margin:12px 0;}
-.reco2013-title{background:url(<%= asset_path "reco2013-title.jpg"%>);width:114px;height:33px;float:left;text-indent:-999em;}
-.reco2013-title p{font-size:12px;margin-top:1px;}
-.reco2013-divider{width:458px;border-top:1px solid #e6e6e6;margin:15px 5px;float:left;}
-.reco2013-list{clear:both;overflow:hidden;}
-.reco2013-list li{width:106px;height:37px;float:left;_display:inline;margin:15px 8px 25px 0;}
-.reco2013-list label{width:106px;height:37px;position:relative;display:block;margin:0;cursor:pointer;}
-.reco2013-list li input{position:absolute;left:0;bottom:0;}
-.reco2013-list li p{position:absolute;left:0;bottom:-15px;width:110px;}
-
-.reco2013-list2 li{width:90px;height:75px;text-align:center;float:left;_display:inline;font-size:11px;margin:5px;}
-.reco2013-list2 label{width:65px;height:75px;display:block;margin:0;cursor:pointer;}
-.reco2013-list2 div{background:url(<%= asset_path "reco2013.jpg"%>) no-repeat;width:38px;height:39px;margin:10px auto;}
-.reco2013-list2 p{clear:both;}
-.reco2013-list2 .reco2-list2{background-position:-102px 0;}
-.reco2013-list2 .reco2-list3{background-position:-204px 0;}
-.reco2013-list2 .reco2-list4{background-position:-306px 0;}
-.reco2013-list2 .reco2-list5{background-position:-408px 0;}
-.reco2013-list2 .reco2-list6{background-position:-510px 0;}
-.reco2013-list2 .reco2-list7{background-position:-2px -84px;}
-.reco2013-list2 .reco2-list8{background-position:-104px -83px;}
-.reco2013-list2 .reco2-list9{background-position:-206px -83px;}
-.reco2013-list2 .reco2-list10{background-position:-308px -83px;}
-.reco2013-list2 .reco2-list11{background-position:-410px -83px;}
-.reco2013-list2 .reco2-list12{background-position:-512px -83px;}
-.upload2013-overflow{overflow:auto;height:400px;margin-top:12px;}
-
 .upload2013_2 .load_submit{background:url(<%= asset_path "submit.jpg"%>);width:155px;height:51px;margin:10px auto;}
 .sure_submit{background:url(<%= asset_path "submit_bg.jpg"%>);width:155px!important;height:51px!important;margin:10px auto;color:#712222;font:20px/50px "Microsoft Yahei";text-align:center;}  
 .submit_form .sure_submit{line-height:30px;border:none;} 
diff --git a/app/assets/stylesheets/application.css b/app/assets/stylesheets/application.css
index dd7a66c..897ddda 100644
--- a/app/assets/stylesheets/application.css
+++ b/app/assets/stylesheets/application.css
@@ -12,5 +12,4 @@
  *= require reset
  *= require base
  *= require special_events
- *= require winner
 */
diff --git a/app/assets/stylesheets/style.css.erb b/app/assets/stylesheets/style.css.erb
index a19cdf4..089e041 100644
--- a/app/assets/stylesheets/style.css.erb
+++ b/app/assets/stylesheets/style.css.erb
@@ -958,9 +958,9 @@ ul.color_square{ overflow:hidden; padding:50px 40px 20px; width:730px;}
 .art_step .awards_list ul{width:520px;float:left;padding:0 0 20px;}
 .art_step .awards_list ul li{overflow:hidden;padding:5px 0;}
 .art_step .awards_list ul span,.art_step .awards_list ul strong,.art_step .awards_list ul em{float:left;line-height:20px;display: block;overflow: hidden;}
-.art_step .awards_list ul span{width:217px;color:#666666;font-size:15px;}
-.art_step .awards_list ul strong{color:#459f1c;font-size:16px;width:221px;}
-.art_step .awards_list ul em{width:81px;color:#666666;font-size:18px;font-style:normal;font-weight:normal;}
+.art_step .awards_list ul span{width:235px;color:#666666;font-size:15px;}
+.art_step .awards_list ul strong{color:#459f1c;font-size:16px;width:200px;}
+.art_step .awards_list ul em{width:85px;color:#666666;font-size:18px;font-style:normal;font-weight:normal;}
 .art_step .awards_list ul ul{float: left;width:auto;padding:0;}
 .art_step .awards_list ul ul li{padding:0 0 10px;line-height:20px;}
 .art_step .awards_list a{position: absolute;width:33px;height:59px;top:50%;left:50px;margin-top:-16px;}
diff --git a/app/assets/stylesheets/winner.css.erb b/app/assets/stylesheets/winner.css.erb
deleted file mode 100644
index 443aeee..0000000
--- a/app/assets/stylesheets/winner.css.erb
+++ /dev/null
@@ -1,31 +0,0 @@
-@charset "utf-8";
-
-.winner-bin{background: url(<%= asset_path "winner/winner-bg.jpg"%>) no-repeat;width: 963px;margin: 30px auto 50px;}
-.winner-bin h1{height: 400px;}
-.winner-bin h1,.winner-bin h2,.winner-prev,.winner-next{text-indent: -999em;}
-.winner-bin h2{background: url(<%= asset_path "winner/winner-hd.png"%>) no-repeat;height: 36px;}
-.pd30{padding: 30px;}
-.winner-reg{background: #f5c294;padding-top: 1px;}
-.winner-reg h2{left: 30px;top: -35px;}
-.winner-reg h2,.winner-vote h2{width: 127px;}
-.winner-slide{width: 850px;margin: 0 auto;}
-.winner-prev,.winner-next{background: url(<%= asset_path "winner/winner-bullets.png"%>) no-repeat;width: 33px;height: 57px;left: 0;top: 52%;margin-top: -29px;filter:alpha(opacity=50);opacity: 0.5;
-	-webkit-transition:opacity 0.5s;
-	-moz-transition:opacity 0.5s;
-	transition:opacity 0.5s;
-	_background-image: url(<%= asset_path "winner/winner-bullets.gif"%>);
-}
-.winner-next{background-position: -33px 0;left: auto;right: 0;}
-.winner-prev:hover,.winner-next:hover{filter:alpha(opacity=100);opacity: 1;}
-.winner-slide-bin{width: 664px;margin: 0 auto;overflow: hidden;}
-.winner-slide-bin ul{overflow: hidden;float: left;_display: inline;}
-.winner-slide-bin li{width: 664px;text-align: right;margin: 10px 0;font: bold 14px "SimHei";color: #fefffe;*margin: 5px 0;}
-.winner-slide-bin .h3{background: url(<%= asset_path "winner/winner-bg2.png"%>) no-repeat;text-align: center;width: 664px;height: 18px;margin: 20px auto;padding: 5px 0;line-height: 18px;font-size: 18px;font-weight: bold;color: #fff;}
-.winner-slide-bin span{float: left;font: 15px "Microsoft Yahei";margin-top: -2px;}
-.winner-slide-container{width: 99999em;position: relative;}
-
-.winner-vote{background: #ff861f;}
-.winner-vote h2{background-position: -127px 0;}
-
-.winner-color{background: #9f1b1b;}
-.winner-color h2{width: 441px;background-position: -254px 0;}
\ No newline at end of file
diff --git a/app/controllers/api_controller.rb b/app/controllers/api_controller.rb
index d6b4294..611b026 100644
--- a/app/controllers/api_controller.rb
+++ b/app/controllers/api_controller.rb
@@ -9,8 +9,7 @@ class ApiController < ApplicationController
     user.email = params[:email]
     user.is_read = true
     user.is_from_minisite = true
-    user.area_id = params[:area_id] ? params[:area_id] : 31
-    user.phone = params[:phone]
+    user.area_id = params[:area_id]
     #user.role_id = Role.find_by_role(params[:role]).id
     case params[:role]
     when "designer1"
@@ -25,10 +24,10 @@ class ApiController < ApplicationController
       user.role_id = 3
     end
       
-    if user.save(validate: false)
+    if user.save
       respond_to do |format|
         format.json {render :json => { :result => 'true',
-         :mag => "注册成功!", :uid => '#{user.id}' } }
+         :mag => "注册成功!" } }
       end
       #render :text => '<results suc="true" msg=""/>'
     else
@@ -52,7 +51,7 @@ class ApiController < ApplicationController
     if user && user.valid_password?(params[:password])
       respond_to do |format|
         format.json {render :json => { :result => 'true',
-         :mag => "登陆成功!", :uid => "#{user.id}" } }
+         :mag => "登陆成功!" } }
       end
       #render :text => '<results suc="true" msg=""/>'
     else
@@ -63,60 +62,4 @@ class ApiController < ApplicationController
       #render :text => '<results suc="false" msg=""/>'
     end
   end
-
-  def update_user
-    user = User.find params[:user_id]
-    user.email = params[:email]
-    user.is_read = true
-    user.is_from_minisite = true
-    user.area_id = params[:area_id] if params[:area_id]
-    user.phone = params[:phone]
-    #user.role_id = Role.find_by_role(params[:role]).id
-    case params[:role]
-    when "designer1"
-      user.role_id = 1
-      user.des_status = 1
-    when "designer0"
-      user.role_id = 1
-      user.des_status = 0
-    when "company"
-      user.role_id = 2 
-    when "user"
-      user.role_id = 3
-    end
-    if user.save(validate: false)
-      respond_to do |format|
-        format.json {render :json => { :result => 'true',
-         :mag => "注册成功!", :uid => '#{user.id}' } }
-      end
-    else
-      messages = ''
-      valid_result = user.errors.messages
-      if valid_result.size > 0
-        valid_result.each do |_, value|
-          messages << value[0]
-        end
-      end
-      respond_to do |format|
-        format.json {render :json => { :result => 'false',
-         :mag =>"#{messages}" } }
-      end
-    end
-  end
-
-  def external_login
-    session[:api_login] = 'mobile'
-    if params[:type] == "weibo"
-      redirect_to "/users/auth/weibo"
-    end
-    if params[:type] == "qq_connect"
-      redirect_to "/users/auth/qq_connect"
-    end
-    if params[:type] == "renren"
-      redirect_to "/users/auth/renren"
-    end
-    if params[:type] == "kaixin"
-      redirect_to "/users/auth/kaixin"
-    end
-  end
 end
diff --git a/app/controllers/articles_controller.rb b/app/controllers/articles_controller.rb
index 42b4a72..d450c87 100644
--- a/app/controllers/articles_controller.rb
+++ b/app/controllers/articles_controller.rb
@@ -3,22 +3,18 @@ class ArticlesController < ApplicationController
 
   def index
     @weekly_tips = WeeklyTip.page(1)
-
-    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
   end
 
   def show
-     @article = Post.find(params[:id])
-     tags=@article.tag_counts_on(:tags)
-     if tags.present?
+    @article = Post.find(params[:id])
+    tags=@article.tag_counts_on(:tags)
+    if tags.present?
      @prev_article = get_articles.tagged_with(tags).where("published_at < ?", @article.published_at).first
      @next_article = get_articles.tagged_with(tags).where("published_at > ?", @article.published_at).last
      else
-      @prev_article = get_articles.where("published_at < ?", @article.published_at).first
-      @next_article = get_articles.where("published_at > ?", @article.published_at).last  
-     end
-
-     expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
+    @prev_article = get_articles.where("published_at < ?", @article.published_at).first
+    @next_article = get_articles.where("published_at > ?", @article.published_at).last  
+     end  
   end
 
   def get_articles
diff --git a/app/controllers/baicheng/design_competes_controller.rb b/app/controllers/baicheng/design_competes_controller.rb
index 273d67d..b1837f4 100644
--- a/app/controllers/baicheng/design_competes_controller.rb
+++ b/app/controllers/baicheng/design_competes_controller.rb
@@ -44,76 +44,10 @@ class Baicheng::DesignCompetesController < ApplicationController
     @design = Design.baicheng.find params[:id]
     @story_id = @design.story_id
     @story = Story.where(id: @story_id).first
-    
- 	  @design_images = @design.design_images.available
-  	@image_colors = []
-  	@design_images.each do |image|
-  		@image_colors << ColorCode.where("code in (?)", [image.color1, image.color2, image.color3])
-  	end
- 
     @comments = @design.comments.page(params[:page]).per(8)
   end
 
-  def comment
-    if params[:story_id] && params[:comment_id]
-      if current_user
-        ReStory.create!(user_id: current_user.id, story_comment_id: params[:comment_id], content: params[:content])
-      else
-        ReStory.create(story_comment_id: params[:comment_id], content: params[:content])
-      end
-    else
-      Story.increment_counter(:comment_count, params[:story_id])
-      if current_user
-        StoryComment.create(user_id: current_user.id, story_id: params[:story_id], content: params[:content])
-      else
-        StoryComment.create(story_id: params[:story_id], content: params[:content])
-      end
-    end
-    redirect_to design_compete_path(params[:story_id])
-  end
-
-  def destroy_comment
-    comment = StoryComment.find params[:id]
-    if comment.destroy
-      redirect_to design_compete_path(params[:story_id])
-    else
-      render nothing: true, status: 404
-    end
-  end
-
-  def download
-    # target_file = Story.find params[:id]
-    # unless target_file.blank?
-    #   zipfile_name = "#{Rails.root}/public/design_competes#{params[:id]}.zip"
-    #   if File.exists?(zipfile_name)
-    #     send_file zipfile_name
-    #   else
-    #     Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
-    #       if target_file.length == 1
-    #         filename = target_file
-    #         zipfile.add(filename.file_file_name, filename.file.path) if File.exists?(filename.file.path)
-    #       else
-    #         target_file.each do |filename|
-    #           zipfile.add(filename.file_file_name, filename.file.path) if File.exists?(filename.file.path)
-    #         end
-    #       end
-    #     end
-    #     send_file zipfile_name
-    #   end
-    # else
-    #   redirect_to :back
-    # end
-    target_file = Story.find params[:id]
-    if target_file
-      if File.exists?(target_file.story_image.file.path)
-        send_file target_file.story_image.file.path
-      else
-        render nothing: true, status: 404
-      end
-    else
-      render nothing: true, status: 404
-    end
-  end
+ 
 
   def get_tags
     @tags = []
@@ -123,4 +57,4 @@ class Baicheng::DesignCompetesController < ApplicationController
     end
   end
 
-end
\ No newline at end of file
+end
diff --git a/app/controllers/baicheng/stories_controller.rb b/app/controllers/baicheng/stories_controller.rb
index 0cded17..3aa4452 100644
--- a/app/controllers/baicheng/stories_controller.rb
+++ b/app/controllers/baicheng/stories_controller.rb
@@ -57,7 +57,7 @@ class Baicheng::StoriesController < ApplicationController
         story = Story.new(params[:story])
       end
       story.user_id = current_user.id
-      story.budget =  params[:fee] if params[:fee].present?
+      story.budget =  params[:fee].join(",") if params[:fee].present?
       if story.save
         tags.each do |tag|
           StoryImageTag.create(image_library_category_id: tag, story_image_id: story.id)
@@ -80,7 +80,7 @@ class Baicheng::StoriesController < ApplicationController
       tags += params[:room] if params[:room].present?
       story = Story.find(params[:stroy_id])
       story.user_id = current_user.id
-      story.budget =  params[:fee] if params[:fee].present?
+      story.budget =  params[:fee].join(",") if params[:fee].present?
       if story.save
         sit = StoryImageTag.where(story_image_id: story.id)
         if sit.present?
@@ -109,14 +109,29 @@ class Baicheng::StoriesController < ApplicationController
     story_image.story_id = params[:story_id]
     story_image.is_cover = true
     if story_image.save  
-      @story = Story.find params[:story_id]
-      @story.is_save = true
-      @story.save
     else
       render :image_new
     end
   end
 
+  def update_title
+    if params[:title].present? 
+      title = params[:title]
+    else
+      title = current_user.name ? current_user.name : current_user.username
+    end
+    content = params[:content].present? ? params[:content] : "美味的佳肴，清新的空气，亲密的家人……生活的每个细节都散发着幸福的味道。因爱之名，刷新生活！我要让家人更健康更舒适更快乐的生活！"
+    story = Story.find(params[:stroy_id])
+    story.title = title
+    story.content = content
+    story.is_save = true
+    if story.save
+
+    else
+      render :update_image
+    end
+  end
+
   def show
     @story = Story.find(params[:id])
     @story_image = @story.story_image
diff --git a/app/controllers/baicheng/sysinfo_controller.rb b/app/controllers/baicheng/sysinfo_controller.rb
index cb85c74..f036415 100644
--- a/app/controllers/baicheng/sysinfo_controller.rb
+++ b/app/controllers/baicheng/sysinfo_controller.rb
@@ -3,7 +3,11 @@ class Baicheng::SysinfoController < ApplicationController
   layout 'baicheng'
  
   def index
-    @msgs = current_user.sys_msgs.baicheng.page(params[:page])
+    @msgs = current_user.sys_msgs.unscoped.baicheng.baicheng_order.order('status asc, created_at desc').page(params[:page])
+  end
+  def show
+    @msg =  current_user.sys_msgs.baicheng.find(params[:id])
+    @msg.read
+    redirect_to   @msg.re_url || root_path
   end
-
 end
\ No newline at end of file
diff --git a/app/controllers/channel_controller.rb b/app/controllers/channel_controller.rb
index b474587..1feb87b 100644
--- a/app/controllers/channel_controller.rb
+++ b/app/controllers/channel_controller.rb
@@ -1,9 +1,8 @@
 # encoding: utf-8
 
 class ChannelController < ApplicationController
-  #caches_page :index, :expires_in => 60.minutes
-  
-   #设计快查
+
+  #设计快查
   def access
     params[:search] ||= {}
     
@@ -35,24 +34,20 @@ class ChannelController < ApplicationController
       params[:search][:user_area_id_in] = Area.robot(province_id,[city_id].compact).map(&:id)
     end
     
-    @search = DesignImage.available.users.search(params[:search])
+    @search = DesignImage.users.search(params[:search])
     @design_users = @search.page(params[:page]).per(8)
     
     #mood
     @moods = Mood.order("created_at desc").limit(5)
-    
-    #每周之星,月度之星 = stars
-    stars = WeeklyStar.order("published_at desc").partition {|weekly_star| weekly_star.star_type_id == 1 }
-    
-    weekly_user_ids,per_month_user_ids = stars.collect {|star| star.map(&:user_id).compact.uniq}
-    
-    @designers  = User.weekly_related(1,weekly_user_ids).page(1).per(8)
 
-    @companys   = User.weekly_related(2,per_month_user_ids).page(1).per(16)
+    design_user_ids = WeeklyStar.order("id desc").map(&:author_url).collect {|url| url.scan(/(\d+)(\/designs)/) && $1 }.compact.uniq
+    
+    @designers  = User.weekly_related(1,design_user_ids).limit(8)
 
-    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
+    @companys   = User.weekly_related(2,design_user_ids).limit(16)
   end
 
   def refresh_service
+    
   end
 end
\ No newline at end of file
diff --git a/app/controllers/color_designs_controller.rb b/app/controllers/color_designs_controller.rb
index 9fddebe..baeec2a 100644
--- a/app/controllers/color_designs_controller.rb
+++ b/app/controllers/color_designs_controller.rb
@@ -15,8 +15,6 @@ class ColorDesignsController < ApplicationController
       @designs = @designs.where(:design_usage => params[:design_usage]) if params[:design_usage] && !params[:design_usage].blank? && params[:design_usage] !='功能区'
 
     end
-
-    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
   end
   
   def show
@@ -32,8 +30,6 @@ class ColorDesignsController < ApplicationController
     @design_prev = ColorDesign.where("id > ?", params[:id]).last if @design
     @design_prev = @design_prev.id if @design_prev
     @design_prev = @design.id if @design_prev.blank?
-
-    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
   end
 
   def get_color_designs
diff --git a/app/controllers/comments_controller.rb b/app/controllers/comments_controller.rb
index 46255fb..be34088 100644
--- a/app/controllers/comments_controller.rb
+++ b/app/controllers/comments_controller.rb
@@ -43,4 +43,4 @@ class CommentsController < ApplicationController
     comment.destroy
     redirect_to :back
   end
-end
\ No newline at end of file
+end
diff --git a/app/controllers/design_images_controller.rb b/app/controllers/design_images_controller.rb
index 4fd2c05..afe7108 100644
--- a/app/controllers/design_images_controller.rb
+++ b/app/controllers/design_images_controller.rb
@@ -41,7 +41,6 @@ class DesignImagesController < ApplicationController
 
   def index
     @content = []
-    @imageable_type = ""
     @images = DesignImage.available.audited_with_colors
     @image_length = @images.count
     @categories = ImageLibraryCategory.where(parent_id: nil).includes(:children).order("position")
@@ -62,31 +61,30 @@ class DesignImagesController < ApplicationController
           else
             tag_id = tag.id
           end
-         
-          @content[1] = (tag.title == "按风格" ? "风格" : tag.title)  if tag_id == 34 
-          @content[2] = (tag.title == "按调性" ? "调性" : tag.title)  if tag_id == 62  
-          @content[3] = (tag.title == "按面积" ? "面积" : tag.title)  if tag_id == 28  
-          @content[4] = (tag.title == "按费用" ? "费用" : tag.title)  if tag_id == 19  
-          @content[5] = (tag.title == "按户型" ? "户型" : tag.title)  if tag_id == 1  
-          @content[6] = (tag.title == "按色彩" ? "色彩" : tag.title)  if tag_id == 107 
-          @content[7] = (tag.title == "按用途" ? "用途" : tag.title)  if tag_id == 122
-          @content[8] = (tag.title == "按人群" ? "人群" : tag.title)  if tag_id == 127
-          @content[9] = (tag.title == "按图片" ? "图片" : tag.title)  if tag_id == 132
-          @content[11] = (tag.title == "按空间" ? "空间" : tag.title)  if tag_id == 82  
-          @content[12] = (tag.title == "按家具" ? "家具" : tag.title)  if tag_id == 211 
-          @content[13] = (tag.title == "按灯具" ? "灯具" : tag.title)  if tag_id == 212 
-          @content[14] = (tag.title == "按布艺" ? "布艺" : tag.title)  if tag_id == 213
-          @content[15] = (tag.title == "按漆面" ? "漆面" : tag.title)  if tag_id == 214  
-          @content[16] = (tag.title == "按饰品" ? "饰品" : tag.title)  if tag_id == 215  
-          @content[17] = (tag.title == "按家电" ? "家电" : tag.title)  if tag_id == 216  
-          @content[18] = (tag.title == "按橱柜" ? "橱柜" : tag.title)  if tag_id == 217
-          @content[19] = (tag.title == "按卫浴" ? "卫浴" : tag.title)  if tag_id == 218
-          @content[20] = (tag.title == "按瓷砖" ? "瓷砖" : tag.title)  if tag_id == 219
-          @content[21] = (tag.title == "按地板" ? "地板" : tag.title)  if tag_id == 220
-          @content[22] = (tag.title == "按用品" ? "用品" : tag.title)  if tag_id == 221
-          @content[23] = (tag.title == "按门窗" ? "门窗" : tag.title)  if tag_id == 222
-          @content[24] = (tag.title == "按数码" ? "数码" : tag.title)  if tag_id == 223
-          @content[25] = (tag.title == "按其他" ? "其他" : tag.title)  if tag_id == 224
+          @content[1] = "按风格" if tag_id == 34  
+          @content[2] = "按调性" if tag_id == 62  
+          @content[3] = "按面积" if tag_id == 28  
+          @content[4] = "按费用" if tag_id == 19  
+          @content[5] = "按户型" if tag_id == 1  
+          @content[6] = "按色彩" if tag_id == 107 
+          @content[7] = "按用途" if tag_id == 122
+          @content[8] = "按人群" if tag_id == 127
+          @content[9] = "按图片" if tag_id == 132
+          @content[10] = "按空间" if tag_id == 82  
+          @content[12] = "按家具" if tag_id == 211 
+          @content[13] = "按灯具" if tag_id == 212 
+          @content[14] = "按布艺" if tag_id == 213
+          @content[15] = "按漆面" if tag_id == 214  
+          @content[16] = "按饰品" if tag_id == 215  
+          @content[17] = "按家电" if tag_id == 216  
+          @content[18] = "按橱柜" if tag_id == 217
+          @content[19] = "按卫浴" if tag_id == 218
+          @content[20] = "按瓷砖" if tag_id == 219
+          @content[21] = "按地板" if tag_id == 220
+          @content[22] = "按用品" if tag_id == 221
+          @content[23] = "按门窗" if tag_id == 222
+          @content[24] = "按数码" if tag_id == 223
+          @content[25] = "按其他" if tag_id == 224
 
           tag_arrs << tag_arr
         end
@@ -101,7 +99,7 @@ class DesignImagesController < ApplicationController
 
     if params[:area_id].present? && params[:area_id].to_s != "0"
       area = Area.find(params[:area_id])
-      @content[0] = area.parent.blank? ? nil : area.parent.name 
+      @content[0] = area.parent.name 
       areas = area.self_and_descendants
       area_tree = area.self_and_ancestors.map(&:id)
       @area_names = area.self_and_ancestors.map(&:name).join(" ")
@@ -113,16 +111,9 @@ class DesignImagesController < ApplicationController
       tags = ImageLibraryCategory.where("title LIKE ?", "%#{params[:search]}%")
       @images = @images.search_tags(tags.map(&:id), true)
       @tag_names << tags.map(&:title)
-      @content[6] = "#{params[:search]}" + "#{@content[6]}" if params[:search] == "橙色系"
-      @content[5] = "#{params[:search]}" + "#{@content[5]}" if params[:search] == "小户型"
-      @content[11] = "#{params[:search]}" + "#{@content[11]}" if params[:search] == "客厅"
-      @content[1] = "#{params[:search]}" + "#{@content[1]}" if params[:search] == "简约"
     end
 
     if params[:imageable_type].present? && params[:imageable_type].to_s != "all"
-      @imageable_type = "大师作品" if params[:imageable_type] == "MasterDesign"
-      @imageable_type = "设计之星" if params[:imageable_type] == "WeekStart"
-      @imageable_type = "色彩配搭" if params[:imageable_type] == "ColorDesign"
       if params[:imageable_type] == 'WeekStart'
         @images = @images.where("sorts = 2")
       else
@@ -132,7 +123,7 @@ class DesignImagesController < ApplicationController
 
     if params[:pinyin].present? && params[:pinyin].to_s != "0"
       tags = ImageLibraryCategory.where("pinyin LIKE ?", "#{params[:pinyin]}%")
-      @content[10] = params[:pinyin]
+      @content[11] = params[:pinyin]
       @images = @images.search_tags(tags.map(&:id), true)
       @tag_names << tags.map(&:title)
     end
@@ -161,7 +152,7 @@ class DesignImagesController < ApplicationController
     @images.each do |image|
       @image_colors << ColorCode.where("code in (?)", [image.color1, image.color2, image.color3])
     end
-    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
+    expires_in 30.minutes, 'max-stale' => 1.hours, :public => true
   end
 
   def image_tag
@@ -242,7 +233,7 @@ class DesignImagesController < ApplicationController
   end
 
   def image_show
-    @image = DesignImage.from.includes(:design).includes(:tags).find(params[:id])
+    @image = DesignImage.includes(:design).includes(:tags).find(params[:id])
     if @image.imageable_type == "MasterDesign"
        @master_design = MasterDesign.find(@image.imageable_id)
     end
@@ -250,7 +241,7 @@ class DesignImagesController < ApplicationController
     @image.view_count += 1
     @image.update_attributes(:view_count => @image.view_count)
     @images_total = DesignImage.available.audited_with_colors.count
-    @image_tags = ImageLibraryCategory.find_all_by_id(@image.tags.map(&:image_library_category_id)).map{|a| a.title}
+    @image_tags = ImageLibraryCategory.find(@image.tags.map(&:image_library_category_id)).map{|a| a.title}
     # @image_styles = @image.try(:design_id) && DesignTags.design_style(@image.design_id)
     if @image.area_id
       area = Area.find(@image.area_id)
@@ -353,7 +344,7 @@ class DesignImagesController < ApplicationController
     @image_colors = ColorCode.where("code in (?)", [@image.color1,@image.color2,@image.color3])
     @comments = @image.comments.page(params[:page]).per(3)
     #精品推荐
-    @week_stars = WeeklyStar.from.order("created_at desc").limit(4)
+    @week_stars = WeeklyStar.order("created_at desc").limit(4)
     #猜你喜欢
     tags = @image.tags.map(&:image_library_category_id)
     if tags == []
diff --git a/app/controllers/designs_controller.rb b/app/controllers/designs_controller.rb
index 1f3c343..f3e0c6c 100644
--- a/app/controllers/designs_controller.rb
+++ b/app/controllers/designs_controller.rb
@@ -37,21 +37,21 @@ class DesignsController < ApplicationController
   def index
     sort_input = MagicSetting.recommend_designs
     if @user
-      @designs = @user.designs.order("designs.id in (#{sort_input}) desc").order("designs.created_at desc").includes(:design_images).page(params[:page])
+      @designs = @user.designs.order("designs.id in (#{sort_input}) desc").order("created_at desc").page(params[:page]).joins(:design_images).group("imageable_id")
 
       load_skin
     else
-      @designs = Design.order("designs.id in (#{sort_input}) desc").includes(:design_images).page(params[:page]).per(9)
+      @designs = Design.order("designs.id in (#{sort_input}) desc").page(params[:page]).per(9).joins(:design_images).group("imageable_id")
     end
     unless @designs.nil?
       if params[:order] == "最热"
         @designs = @designs.order("votes_count desc")
-      elsif params[:order] == "未来之星"
-        @designs = @designs.where(future_star_active: true)
+      elsif params[:order] == "超越刷新"
+        @designs = @designs.order("is_refresh desc")
       elsif params[:q] == "super_refresh"
-        @designs = @designs.where(is_refresh: true).order("designs.created_at desc")
+        @designs = @designs.where(is_refresh: true).order("created_at desc")
       else
-        @designs = @designs.order("designs.created_at desc")
+        @designs = @designs.order("created_at desc")
       end
       style = "%#{params[:style]}%"
       design_color = "%#{params[:design_color]}%"
@@ -65,7 +65,6 @@ class DesignsController < ApplicationController
         @designs = @designs.where("designs.area_id in (#{area.map(&:id).join(',')})")
       end
     end
-    @designs = @designs.joins(:design_images)
     sign_in(@user) if current_admin && @user
   end
 
@@ -84,7 +83,7 @@ class DesignsController < ApplicationController
   end
 
   def new
-    if current_user.present? && !current_user.common_user?
+    if current_user.present?
       @design = current_user.designs.new
     else
       redirect_to '/'
@@ -198,20 +197,7 @@ class DesignsController < ApplicationController
       design_image_ids.each do |design_image_id|
         image = @design.design_images.find(design_image_id)
         image.title = params[:title][design_image_id] if params[:title] && params[:title][design_image_id].present?
-        if params[:color_name] && params[:color_name][design_image_id].present?
-          color1 = nil
-          color2 = nil
-          color3 = nil
-
-          params[:color_name][design_image_id].each_with_index do |color_name,index|
-            color1 = color_name if "color1" == "color#{index + 1}"
-            color2 = color_name if "color2" == "color#{index + 1}"
-            color3 = color_name if "color3" == "color#{index + 1}"
-          end
-          image.color1 = color1
-          image.color2 = color2
-          image.color3 = color3
-        end 
+        image.color1 = params[:color1][design_image_id] if params[:color1] && params[:color1][design_image_id].present?
         image.is_cover = true if params[:cover_image] && params[:cover_image].to_i == design_image_id.to_i
         image.area_id = @design.area_id
         if image.save
@@ -380,7 +366,7 @@ class DesignsController < ApplicationController
 
   private
   def find_design
-    if current_user.present? && !current_user.common_user?
+    if current_user.present?
       @design = current_user.designs.find(params[:id])
     else
       redirect_to '/'
diff --git a/app/controllers/gifts_controller.rb b/app/controllers/gifts_controller.rb
index 98b1479..1650909 100644
--- a/app/controllers/gifts_controller.rb
+++ b/app/controllers/gifts_controller.rb
@@ -1,17 +1,73 @@
 # -*- encoding : utf-8 -*-
 
 class GiftsController < ApplicationController
+	before_filter :get_dates_1
+	before_filter :get_dates_2
+	before_filter :get_dates_3
+	before_filter :get_dates_4
+
 	def index
+		@gift1 = Gift.where(" gift_type like ?", "iColor点评王奖").order("give_time DESC")
+		@gift2 = Gift.where(" gift_type like ?", "月度最佳色彩及设计奖").order("give_time DESC")
+		@gift3 = Gift.where(" gift_type like ?", "注册幸运奖").order("give_time DESC")
+		@gift4 = Gift.where(" gift_type like ?", "投票有礼奖").order("give_time DESC")
+    end
+       
+#由于数据库本身时间参数问题，时差8小时需要通过将北京时间减一天补回来，此时日期与数据库内存储日期（不考虑时间）一致,
+#在页面中显示参数时需增加一天
+	def get_dates_1
+         @dates_arr1 = []              
+         @gift1 = Gift.where(" gift_type like ?", "iColor点评王奖").order("give_time DESC")
+         unless @gift1.nil?
+             @gift1.each do |g|
+              time = [(g.give_time - 1.days), (g.end_time - 1.days)]
+                unless @dates_arr1.include? time
+                    @dates_arr1 << time     
+                end  
+             end
+         @dates_arr1
+         end
+	end
 
-        #注册有奖             
-        @reg_luck = Gift.where("gift_type like ?", "注册幸运奖").order("give_time DESC")
-        @regs = @reg_luck.collect{|item| [item.give_time - 1.days, item.end_time - 1.days]}.uniq
+	def get_dates_2
+    	@dates_arr2 = []
+    	@gift2 = Gift.where(" gift_type like ?", "月度最佳色彩及设计奖").order("give_time DESC")
+    	unless @gift2.nil?
+     	@gift2.each do |g|  
+     		time = g.end_time.strftime("%Y/%m")
+     		unless @dates_arr2.include? time	
+     			@dates_arr2 << time 	
+     		end		
+		end
+		@dates_arr2
+	    end
+	end
 
-        #投票有礼
-        @vote_luck = Gift.where("gift_type like ?", "投票有礼奖").order("give_time DESC") 
-        @votes = @vote_luck.collect{|item| item.end_time.strftime("%Y/%m")}.uniq
+	def get_dates_3
+    	 @dates_arr3 = []              
+         @gift3 = Gift.where(" gift_type like ?", "注册幸运奖").order("give_time DESC")
+         unless @gift3.nil?
+             @gift3.each do |g|
+              time = [(g.give_time - 1.days), (g.end_time - 1.days)]
+                unless @dates_arr3.include? time
+                    @dates_arr3 << time     
+                end  
+             end
+         @dates_arr3
+         end
+	end
 
-        @month_best = Gift.where("gift_type like ?", "月度最佳色彩及设计奖").order("give_time DESC")
-        @months = @month_best.collect{|item| item.end_time.strftime("%Y/%m")}.uniq
-    end
+	def get_dates_4
+    	@dates_arr4 = []
+    	@gift4 = Gift.where(" gift_type like ?", "投票有礼奖").order("give_time DESC")	
+    	unless @gift4.nil?
+     	@gift4.each do |g|
+     		time = g.end_time.strftime("%Y/%m")
+     		unless @dates_arr4.include? time	
+     			@dates_arr4 << time 	
+     		end		
+		end
+		@dates_arr4
+	    end
+	end
 end
diff --git a/app/controllers/lands_controller.rb b/app/controllers/lands_controller.rb
index a89bf9f..c22a0bb 100644
--- a/app/controllers/lands_controller.rb
+++ b/app/controllers/lands_controller.rb
@@ -70,12 +70,7 @@ class LandsController < ApplicationController
 							"428_taipingyang_tk3",
 							"428_taipingyang_tk4",
 							"428_pipawang_tk2",
-							"428_pipawang_tk3",
-							"514_sina_tk1",
-							"514_sina_tk2",
-							"514_taipingyang_tk1",
-							"514_zhuangxiu_tk1",
-							"514_pipa_tk1"
+							"428_pipawang_tk3"
 						]
 
 			urls_baicheng = ["baicheng_soufun_tuliao",
@@ -149,26 +144,7 @@ class LandsController < ApplicationController
 							"428_zhuangxiudianpin_baicheng5",
 							"428_pipawang_baicheng1",
 							"428_pipawang_baicheng2",
-							"428_pipawang_baicheng3",
-							"509_soufang_love_1",
-							"509_soufang_love_2",
-							"509_soufang_love_3",
-							"509_soufang_love_4",
-							"509_soufang_love_5",
-							"509_soufang_love_6",
-							"509_soufang_love_7",
-							"509_soufang_love_8",
-							"509_soufang_love_9",
-							"509_soufang_love_10",
-							"509_soufang_love_11",
-							"509_souhu_love_1",
-							"509_souhu_love_2",
-							"509_souhu_love_3",
-							"509_souhu_love_4",
-							"509_souhu_love_5",
-							"509_souhu_love_6",
-							"509_yichuanmei_love_1"
-						]
+							"428_pipawang_baicheng3"]
 
 			urls_color_designs = ["428_sina_color1",
 				"428_sina_color2",
@@ -204,11 +180,7 @@ class LandsController < ApplicationController
 				"428_zhuangxiudianpin_color1",
 				"428_zhuangxiudianpin_color2",
 				"428_zhuangxiudianpin_color3",
-				"428_zhuangxiudianpin_color4",
-				"514_sina_scdp1",
-				"514_taipingyang_scdp1",
-				"514_zhuangxiu_scdp1",
-				"514_zhuangxiu_scdp2"
+				"428_zhuangxiudianpin_color4"
 			]
 			urls_master_designs = ["428_sina_m_design1",
 				"428_sina_m_design4",
@@ -232,9 +204,7 @@ class LandsController < ApplicationController
 				"428_zhuangxiudianpin_m_design4",
 				"428_pipawang_m_design1",
 				"428_pipawang_m_design2",
-				"428_pipawang_m_design3",
-				"514_zhuangxiu_master1",
-				"514_zhuangxiu_master2"]
+				"428_pipawang_m_design3"]
 
 			#0327重新新加的监测
 			urls_design_imgs = ["327_soufang1",
@@ -302,13 +272,7 @@ class LandsController < ApplicationController
 							"428_taipingyang_ck3",
 							"428_taipingyang_ck4",
 							"428_pipawang_ck2",
-							"428_pipawang_ck3",
-							"514_sina_qiubit1",
-							"514_taipingyang_qiubit1",
-							"514_taipingyang_qiubit2",
-							"514_taipingyang_qiubit3",
-							"514_zhuangxiu_qiubit1",
-							"514_pipa_qiubit1"
+							"428_pipawang_ck3"
 						]
 			#TASK 458
 			urls_star = ["327_hejia_star1",
diff --git a/app/controllers/magic_content/image_libraries_controller.rb b/app/controllers/magic_content/image_libraries_controller.rb
index c191558..12baac4 100644
--- a/app/controllers/magic_content/image_libraries_controller.rb
+++ b/app/controllers/magic_content/image_libraries_controller.rb
@@ -5,7 +5,7 @@ module MagicContent
     skip_authorize_resource :only => [:index, :categories, :update_tags, :update_title, :destroy_image, :audited, :autocomplete, :up_down_page, :no_audited]
 
     def index
-      @images = DesignImage.available.order("design_images.id DESC")
+      @images = DesignImage.available.where("no_audited is false").order("design_images.id DESC")
       if params[:genre].present?
         if params[:genre] == 'yes_color' || params[:genre] == 'yes_update' || params[:genre] == 'no_update' || params[:genre] == 'edit_no_verify' || params[:genre] == 'color_no_edit' || params[:genre] == 'edit_no_color' || params[:genre] == 'edit_color' || params[:genre] == 'no_edit_color'
           @images = DesignImage.search_with(params[:genre], 'last_updated_at', "", "")
@@ -22,7 +22,7 @@ module MagicContent
           @page_count = (@images.count / 10).to_i + 1
         end
       end
-      @images = @images.where("no_audited is false").order("design_images.id DESC").page(params[:page]) if @images.present?
+      @images = @images.order("design_images.id DESC").page(params[:page]) if @images.present?
     end
 
     def categories
@@ -164,11 +164,11 @@ module MagicContent
       else
         flash[:alert] = "不予审核未成功！#{@image.errors.full_messages}"
       end
-      # if params[:page].present?
-        redirect_to image_libraries_path(:page => params[:page], :genre => params[:genre], :keywords => params[:keywords], :start_date => params[:start_date], :end_date => params[:end_date])
-      # else
-      #   redirect_to image_libraries_path
-      # end
+      if params[:genre].present?
+        redirect_to image_libraries_path(:genre => params[:genre], :keywords => params[:keywords])
+      else
+        redirect_to image_libraries_path
+      end
     end
 
     def up_down_page
diff --git a/app/controllers/magic_content/report_export_controller.rb b/app/controllers/magic_content/report_export_controller.rb
index fdb76ce..a3ebc83 100644
--- a/app/controllers/magic_content/report_export_controller.rb
+++ b/app/controllers/magic_content/report_export_controller.rb
@@ -73,12 +73,11 @@ module MagicContent
 
   		{}.tap do |results|
         results[:search] = "用户注册数据统计"
-  			results[:columns] = ['用户ID','用户名', '真实姓名', '用户性质','邮件地址','联系电话','省','市','区','收件地址','注册时间','登录次数','招募用户','作品数','所属公司','刷新21用户']
+  			results[:columns] = ['用户ID','用户名','用户性质','邮件地址','联系电话','省','市','区','收件地址','注册时间','登录次数','招募用户','作品数','所属公司','刷新21用户']
   			results[:data] = [].tap do |cell|
   				users.find_each do |user|
   					cell << [user.id,
-  									 user.username,
-                     user.name,
+  									 user.display_name,
   									 user.role_chn_name,
   									 user.try(:email),
   									 user.try(:phone),
@@ -118,18 +117,10 @@ module MagicContent
   			results[:columns] = ['作品ID','上传时间','作品名','推荐色号','用户ID','用户名','用户类型','用户电话','电子邮箱','公司名称','招募用户','分享次数','投票数','评论数','省','市','区','是否刷新百城活动','是否未来设计师活动']
   			results[:data] = [].tap do |cell|
   				designs.find_each do |design|
-            color = ""
-            colors = design.design_images.where("color1 is not null").limit(2)
-            if colors.present?
-              colors.each do |c|
-                color += c.color1 + "   "
-              end
-            end
-
   					cell << [design.id,
   									 design.created_at.strftime("%Y-%m-%d %H:%M:%S"),
   									 design.title,
-  									 color,
+  									 design.try(:recommend_color_category1),
   									 design.user.id,
   									 design.user.display_name,
   									 design.user.role_chn_name,
diff --git a/app/controllers/magic_content/suit_images_controller.rb b/app/controllers/magic_content/suit_images_controller.rb
index 0026e91..15a6230 100644
--- a/app/controllers/magic_content/suit_images_controller.rb
+++ b/app/controllers/magic_content/suit_images_controller.rb
@@ -29,7 +29,7 @@ module MagicContent
       imageable_id = @image.imageable_id
       @images = DesignImage.find_all_by_imageable_id imageable_id
       @image_tag_ids = @image.tags.map &:image_library_category_id
-      @categories = ImageLibraryCategory.where("parent_id is null AND id != 366")
+      @categories = ImageLibraryCategory.where(parent_id: nil)
     end
     
     def update_tags_suits
@@ -95,4 +95,4 @@ module MagicContent
     end
 
   end
-end
+end
\ No newline at end of file
diff --git a/app/controllers/master_interviews_controller.rb b/app/controllers/master_interviews_controller.rb
index 53fad5a..2e21088 100644
--- a/app/controllers/master_interviews_controller.rb
+++ b/app/controllers/master_interviews_controller.rb
@@ -3,14 +3,10 @@ class MasterInterviewsController < ApplicationController
   before_filter :find_by_subject,:except => :show
   def index
     @articles = @articles.where(:master_kind => params[:master_kind]) unless params[:master_kind].blank?
-
-    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
   end
 
   def show
     @article = MasterProfile.find(params[:id])
-
-    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
   end
   
   def all
diff --git a/app/controllers/users/omniauth_callbacks_controller.rb b/app/controllers/users/omniauth_callbacks_controller.rb
index 3743422..11166f9 100644
--- a/app/controllers/users/omniauth_callbacks_controller.rb
+++ b/app/controllers/users/omniauth_callbacks_controller.rb
@@ -36,13 +36,10 @@ class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
         end
 
         flash[:notice] = "Authentication successful"
-        if session[:api_login].present?
-            redirect_to "/icolormobile/icolor/index.php/Users/apilogin/id/#{current_user.id}/username/#{current_user.username}"
-        else
-          if request.env['omniauth.origin'].match %r(community)
-            current_user.user_tokens.find_by_provider(provider).update_attribute :is_binding, true #更新社区绑定状态
-            redirect_to request.env['omniauth.origin'] #设置社区绑定授权后的返回页面
-          end
+
+        if request.env['omniauth.origin'].match %r(community)
+          current_user.user_tokens.find_by_provider(provider).update_attribute :is_binding, true #更新社区绑定状态
+          redirect_to request.env['omniauth.origin'] #设置社区绑定授权后的返回页面
         end
         return
       else
@@ -57,11 +54,8 @@ class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
           if authentication.changed? || authentication.access_token.blank?
             authentication.update_attribute :access_token, omniauth['access_token']
           end
-          if session[:api_login].present?
-            redirect_to "/icolormobile/icolor/index.php/Users/improveinfo/id/#{authentication.user.id}"
-          else
-            sign_in_and_redirect(:user, authentication.user)
-          end
+
+          sign_in_and_redirect(:user, authentication.user)
           return
         else
           #create a new user
@@ -75,20 +69,12 @@ class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
 
           if user.save(:validate => false)
             flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
-            if session[:api_login].present?
-              redirect_to "/icolormobile/icolor/index.php/Users/apilogin/id/#{user.id}/username/#{user.username}"
-            else
-              sign_in(:user, user)
-              redirect_to stored_location_for(user)
-            end
+            sign_in(:user, user)
+            redirect_to stored_location_for(user)
             return
           else
             session[:omniauth] = omniauth.except('extra')
-            if session[:api_login].present?
-              redirect_to "/icolormobile/icolor/index.php/Register/login"
-            else
-              redirect_to new_user_registration_url
-            end
+            redirect_to new_user_registration_url
             return
           end
         end
diff --git a/app/controllers/weekly_stars_controller.rb b/app/controllers/weekly_stars_controller.rb
index e96c3f6..0b76828 100644
--- a/app/controllers/weekly_stars_controller.rb
+++ b/app/controllers/weekly_stars_controller.rb
@@ -49,8 +49,6 @@ class WeeklyStarsController < ApplicationController
     #   star_ids << star.id if star.present?
     # end  
     @elder_designs = WeeklyStar.where("id != ?", weekly_star.id).order("published_at desc").page(params[:page]).per(8)
-
-    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
   end
   
 	DefaultActions.each do |act,star_type|
diff --git a/app/helpers/application_helper.rb b/app/helpers/application_helper.rb
index 6f76c3a..56e5815 100644
--- a/app/helpers/application_helper.rb
+++ b/app/helpers/application_helper.rb
@@ -83,7 +83,7 @@ module ApplicationHelper
         elsif controller_name == 'design_images' && action_name == 'index'
           s1 = ""
           s2 = ""
-          if @content.present? || @imageable_type.present?
+          if @content.present?
             if @content[0..10].present?
               @content[0..10].each do |c|
                 if c.present?
@@ -98,14 +98,12 @@ module ApplicationHelper
                 end
               end
             end
-            @imageable_type + s1 + "装修图片大全，您可以设计自己的" + s2 + " 装修效果图 - 立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
+            "" + s1 + "装修图片大全，您可以设计自己的" + s2 + " 装修效果图 - 立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
           else
-             "装修效果图大全2013图片、室内装修效果图大全、装修效果图 - 立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
+             "风格、调性、面积、费用、户型、色彩、用途、人群、图片、拼音检索、装修图片大全，您可以设计自己的 空间、家具、灯具、布艺、漆面、饰品、家电、橱柜、卫浴、瓷砖、地板、用品、门窗、数码、其他、装修效果图 - 立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
           end
-        # elsif controller_name == 'design_images'
-        #    "装修图片大全，您可以设计自己的装修效果图 - 立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
-        elsif controller_name == 'design_images' && action_name == 'image_show'
-          "#{@image.title}装修图片 - 立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
+        elsif controller_name == 'design_images'
+           "风格、调性、面积、费用、户型、色彩、用途、人群、图片、拼音检索、装修图片大全，您可以设计自己的 空间、家具、灯具、布艺、漆面、饰品、家电、橱柜、卫浴、瓷砖、地板、用品、门窗、数码、其他、装修效果图 - 立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
         #设计之星
         elsif controller_name == 'weekly_stars' && %w{weekly_stars_week index}.include?(action_name)
           "【每周之星 | 设计之星】- 设计鉴赏" + '-' + BASE_TITLE
@@ -235,7 +233,7 @@ module ApplicationHelper
     elsif controller_name == 'master_designs' && action_name == 'show'
       "立邦iColor装修设计鉴赏带您欣赏顶级的【国际、港澳台、国内知名色彩设计大师、室内空间设计大师】#{@master_design.design_name},#{@master_design.master_profile.try(:name) || @master_design.master_name},还有更多精彩装修效果图,以及设计装修案例、灵感家装图片尽在立邦iColor."
     elsif controller_name == 'design_images' && action_name == 'index'
-      if @content.present? || @imageable_type.present?
+      if @content.present?
         s1 = ""
         s2 = ""
         if @content.present?
@@ -254,12 +252,10 @@ module ApplicationHelper
             end
           end
         end
-        "立邦 iColor装修图库，精心挑选#{@imageable_type}" + s1 + "2013装修图片大全，方便您设计自己的" + s2 + "装修效果图，满足您的个性化装修需求。"
+        "立邦 iColor装修图库，精心挑选" + s1 + "2013装修图片大全，方便您设计自己的" + s2 + "装修效果图，满足您的个性化装修需求。"
       else
-        "立邦 iColor装修图库，提供近6万张最流行的装修效果图大全2013图片、室内装修效果图大全欣赏、装修风格鉴赏，展示丰富的客厅、厨房、卫生间、卧室、阳台等各种分类装修效果图，满足您的一切装修设计需求。"
+        "立邦 iColor装修图库，精心挑选 2013装修图片大全，方便您设计自己的按空间 装修效果图，满足您的个性化装修需求。"
       end
-    elsif controller_name == 'design_images' && action_name == 'image_show'
-      "立邦 iColor 装修图库装修效果图专区，提供2013年国内外最新的#{@image.title}装修图片，设计效果图，是目前更新速度最快、最经典的装修效果图案例。"
     #设计之星
     elsif controller_name == 'weekly_stars' && %w{weekly_stars_week index}.include?(action_name)
       star_descript1 + '【每周之星】' + star_descript2
@@ -430,21 +426,17 @@ module ApplicationHelper
     elsif controller_name == 'gifts' && action_name == 'index'
       designer_events_key
     elsif controller_name == 'design_images' && action_name == 'index'
-      if @content.present? || @imageable_type.present?
+      if @content.present?
         content = ""
-        if @content.present?
-          @content.each do |c|
-            if c.present?
-              content += c + ","
-            end
+        @content.each do |c|
+          if c.present?
+            content += c + ","
           end
         end
-        @imageable_type + content + "装修图片 , 装修效果图"
+        content
       else
-        "装修,装修设计,室内装修效果图大全,装修效果图,装修效果图大全2013图片,装修图片,装修风格"
+        ""
       end
-    elsif controller_name == 'design_images' && action_name == 'image_show'
-      "#{@image.title}装修图片,设计效果图,装修图库"
     else
       "iColor,立邦,家装设计,装修案例,装修设计鉴赏,作品欣赏,资讯,家居装修建材,室内装修,装修图片,装修效果图"
     end
diff --git a/app/helpers/designs_helper.rb b/app/helpers/designs_helper.rb
index b8b32b1..63c82f6 100644
--- a/app/helpers/designs_helper.rb
+++ b/app/helpers/designs_helper.rb
@@ -10,7 +10,7 @@ module DesignsHelper
   end
 
   def design_order_option
-    ['排序','最新','最热','未来之星']
+    ['排序','最新','最热','超越刷新']
   end
 
 end
diff --git a/app/models/color_code.rb b/app/models/color_code.rb
index 0513112..748dafc 100644
--- a/app/models/color_code.rb
+++ b/app/models/color_code.rb
@@ -1,17 +1,4 @@
-#encoding:utf-8
 class ColorCode < ActiveRecord::Base
   attr_accessible :code, :name, :rgb
   belongs_to :design
-  SNCOLOR = [["#fdf1d9;","荷兰乳酪","NN3401-4"],["#f7f3e8;","贝壳白","NN1507-4"],["#c3b79f;","细沙海岸","NN2520-3"],["#b4b1ac;","银烛台","NN1370-3"],["#c3b79f;","黑巧克力","NN2500-1"],
-            ["#fcfbf6;","石膏岩","NN1307-4"],["#fcedda;","樱花彩","NN1801-4"],["#ac8b78;","印度褐","NN1270-3"],["#f6eee1;","护花使者","NN1107-4"],["#724e40;","玛瑙","NN1100-1"]]
-  MMCOLOR = [["#fef8e8;","虔诚","YN3007-4"],["#f9c035;","幸运彩","YC2820-3"],["#fdd9a7;","稻花香","NN3410-4"],["#ecefe4;","寒江冷月","GN5207-4"],["#943438;","勃艮地红","RA0700-1"],
-			["#e5edf0;","冬日黄昏","VC7008-4"],["#97a3a3;","企鹅","NN6520-3"],["#5e7070;","忧郁","NN6540-4"],["#f5f1ee;","渴望","VC7208-4"],["#313b3c;","魔力黑","NN6500-1"]]
-  SSCOLOR = [["#f1f6e0;","淡荷彩","GC5301-4"],["#eeecd5;","水色天光","NN6501-4"],["#fffaea;","黄飘带","YC2807-4"],["#c0c755;","绿野仙踪","GC4080-2"],["#757a76;","岩灰","NN1390-2"],
-  			["#edecea;","蝴蝶兰","NN7201-4"],["#f1f8f1;","蟹壳青","OW058-4"],["#cde3e1;","牛津纺","BC6351-4"],["#e3d6df;","西洋丁香","VN0151-4"],["#703a52;","红高粱","VA0200-1"]]			
-  CBCOLOR = [["#f1f6e0;","平静海风","BC6708-4"],["#e8e6f3;","香芋奶昔","VC0035-4"],["#d9edf8;","细雨","BC0017-4"],["#aad6f1;","挪威蓝","BC6810-4"],["#5265a0;","紫丁香","VC7030-2"],
-  			["#eff2a5;","春意盎然","GC4110-3"],["#73c0d2;","霸王花","BC6620-3"],["#ad9cc0;","寂静繁星","VC7270-3"],["#edf0f9;","紫蔓","VC0003-4"],["#05377c;","蝶恋花","BA7000-1"]]
-  PPCOLOR = [["#feecea;","欢乐","RN0507-4"],["#c9e8e3;","海之女","GC5751-4"],["#fbf19c;","报春花","YC3220-3"],["#f8f7c1;","北极春","YC3210-4"],["#fad3cc;","红颜知己","OC1510-4"],
-  			["#e68a99;","甜蜜新娘","RC0530-2"],["#f0c7d9;","羞答答","RC0310-4"],["#d8dd7f;","野性大自然","GC4060-3"],["#35ad80;","锦茵","GC5540-2"],["#e3eeb6;","春意融融","GC4310-4"]]
-  GACOLOR = [["#fffaf4;","象牙白","OW038-4"],["#d41e2d;","番茄汁","RA1500-1"],["#f8ba6d;","橘碧彩","ON1930-2"],["#e9dabb;","锡兰象牙","NN4760-4"],["#f4cf39;","炫目","YA3200-1"],
-  			["#f5e7b8;","切尔沙的世界","NN4851-4"],["#dc7b6b;","西班牙女郎","OC1540-2"],["#fdd9a5;","烛光摇曳","ON1910-4"],["#107a78;","夏威夷","BA5800-1"],["#0e7387;","深海蓝","BA6600-1"]]
 end
diff --git a/app/models/comment.rb b/app/models/comment.rb
index d36cc52..4820cbd 100644
--- a/app/models/comment.rb
+++ b/app/models/comment.rb
@@ -20,11 +20,23 @@ class Comment < ActiveRecord::Base
 
       case self.commentable_type
       when "Design"
+        
         @design = Design.find self.commentable_id 
+        if @design.story 
+          story =  @design.story 
+          SysMsg.send_to(story.user,  "<a href=/users/#{user_id}> #{user_display_name}</a>对为我设计的《<a href=/love/stories/#{story.id}>房型图</a>》 进行了留言。",{:reply_type => "baicheng",
+             :re_url =>"/love/stories/#{story.id}"}   )
+          SysMsg.send_to(@design.user,  "<a href=/users/#{user_id}> #{user_display_name}</a>对我上传的原创设计《<a href=/love/design_competes/#{@design.id}>#{@design.title}</a>》进行了评论。",
+            {:reply_type => "baicheng", :re_url =>"/love/design_competes/#{@design.id}"})
+         end
       when "Inspiration"
         @design = Inspiration.find self.commentable_id
       when "DesignImage"
         @design = DesignImage.find self.commentable_id
+      when 'Story'
+        story = Story.find self.commentable_id
+        SysMsg.send_to(story.user,  "<a href=/users/#{user_id}> #{user_display_name}</a>对我发布的《<a href=/love/stories/#{story.id}>房型图</a>》进行了留言。",
+          {:reply_type => "baicheng",:re_url =>"/love/stories/#{story.id}"})
       end
       if @design
         SysMsg.create(:content => "亲爱的#{@design.user.display_name}用户，您的作品 <<a href=/users/#{@design.user_id}/designs/#{@design.id}>#{@design.title}</a>> 收到了新的回复，请注意查看！",
diff --git a/app/models/design.rb b/app/models/design.rb
index 5d02838..d255e70 100644
--- a/app/models/design.rb
+++ b/app/models/design.rb
@@ -19,7 +19,6 @@ class Design < ActiveRecord::Base
   has_many :design_tags,:class_name => "DesignTags"  
   has_many :design_styles, :through => :design_tags,:source => :image_library_category,:conditions => ["image_library_categories.parent_id = 34"]
   belongs_to :story, :counter_cache => true
-
   has_one :baicheng_event
   #最新的一张作品图片
   has_one :cover_img,:as => :imageable,:class_name => "DesignImage",:order => "design_images.created_at desc"
@@ -30,12 +29,9 @@ class Design < ActiveRecord::Base
   paginates_per 8
 
   after_create :update_user_design_code_count
+  after_create :send_baicheng_sys_msg
   #after_update :sync_baicheng_event
   before_destroy :clear_baicheng_event
-  
-  def design_style_names
-    design_styles.map(&:title).join(',')
-  end
 
   def design_style_names  
     design_styles.map(&:title).join(',')  
@@ -100,8 +96,21 @@ class Design < ActiveRecord::Base
   #   end
   # end
 
+  
   def clear_baicheng_event
     BaichengEvent.find_by_design(self.id).try(:destroy_all)
   end
 
+  private
+  def send_baicheng_sys_msg
+    if self.story
+      Sysmsg.send_to(self.story.user,"设计师<a herf=/users/#{self.user.id} >#{self.user.display_name}</a>对我发布的《<a herf=/love/stories/#{self.story.id}>房型图</a>》上传了设计。",
+        {:reply_type => "baicheng",re_url=>"/love/stories/#{self.story.id}"})
+      ##TODO （比如：想要设计的作品，已上传的作品数量变更）
+      self.story.want_designers.each do |user|
+        Sysmsg.send_to(user,"您的<a herf=/love/stories/act >个人活动主页</a>有最新信息更新，快去查看。",
+          {:reply_type => "baicheng",:re_url =>"/love/stories/act"}) unless user==self.user
+      end
+    end
+  end
 end
diff --git a/app/models/design_image.rb b/app/models/design_image.rb
index 912c72e..28dc957 100644
--- a/app/models/design_image.rb
+++ b/app/models/design_image.rb
@@ -31,8 +31,6 @@ class DesignImage < ActiveRecord::Base
   scope :audited_with_colors, where(["edited_color = ? and audited = ?", true, true])
 
   scope :up_down_image, lambda{ |current_id| unscoped.where("id IN (select max(id) from design_images where id < #{current_id} union select min(id) from design_images where id > #{current_id})").order('id')}
-
-  scope :from, where("created_at > (?)", "2013-3-1")
   
 
   has_attached_file :file,
@@ -74,10 +72,6 @@ class DesignImage < ActiveRecord::Base
     end
   end
 
-  def design_style_names
-    image_styles.map(&:title).join(',')
-  end
-
   # 科普兰德(1)-每周之星(2 后台设置)-大师作品(3)-sina(4)-色彩搭配(5)-自行上传(100)
   def set_sort
     self.sorts = 100 if self.sorts.blank?
@@ -175,10 +169,6 @@ class DesignImage < ActiveRecord::Base
         DesignImage.available.where("(created_at >= :start_date AND created_at <= :end_date) AND (design_images.imageable_type = 'MasterDesign')",{:start_date => start_date.to_time, :end_date => end_date.to_time + 1.day}).order("design_images.id DESC")
       when 'al_date'
         DesignImage.available.where("(updated_at >= :start_date AND updated_at <= :end_date) AND (design_images.imageable_type = 'MasterDesign')",{:start_date => start_date.to_time, :end_date => end_date.to_time + 1.day}).order("design_images.id DESC")
-      when 'last_al_date'
-        DesignImage.available.where("(last_updated_at >= :start_date AND last_updated_at <= :end_date) AND (design_images.imageable_type = 'MasterDesign')",{:start_date => start_date.to_time, :end_date => end_date.to_time + 1.day}).order("design_images.id DESC")
-      when 'last_al_time'
-        DesignImage.available.where("(last_updated_at >= :start_date AND last_updated_at <= :end_date) AND (design_images.imageable_type = 'MasterDesign')",{:start_date => start_date.to_time, :end_date => end_date.to_time + 1.day}).order("design_images.id DESC")
     end
   end
 
diff --git a/app/models/land_source.rb b/app/models/land_source.rb
deleted file mode 100644
index 8d20096..0000000
--- a/app/models/land_source.rb
+++ /dev/null
@@ -1,21 +0,0 @@
-# -*- encoding: utf-8 -*-
-require 'csv'
-class LandSource < ActiveRecord::Base
-  attr_accessible :site, :position, :code, :path
-  validates_uniqueness_of :code
-
-  def self.add_new_lands
-    CSV.foreach("#{Rails.root}/lib/data/new_lands.csv") do |row|
-      site = row[0]
-      position = row[1]
-      code = row[2].scan(/\=[0-9a-z-_]+/)[0].to_s.gsub('=','')
-      if LandSource.find_by_code(code) == nil
-        LandSource.create(site: site, position: position, code: code)
-        p "#{code} added"
-      else
-        p "#{code} has already been added"
-      end
-    end
-  end
-
-end
\ No newline at end of file
diff --git a/app/models/master_profile.rb b/app/models/master_profile.rb
index b15fe37..c14be58 100644
--- a/app/models/master_profile.rb
+++ b/app/models/master_profile.rb
@@ -13,7 +13,7 @@ class MasterProfile < ActiveRecord::Base
     :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
 
   has_attached_file :preview_img_out,
-    :styles => { :thumb => "80x80#", :original => "278x282#", :home_page => "305x314#", :home_page2 => "380x365#", :mobile_original => "145x150#" },
+    :styles => { :thumb => "80x80#", :original => "278x282#", :home_page => "305x314#", :home_page2 => "380x365#" },
     :whiny_thumbnails => true,
     :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
     :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
diff --git a/app/models/rep_reply.rb b/app/models/rep_reply.rb
index 40f9029..ed225f7 100644
--- a/app/models/rep_reply.rb
+++ b/app/models/rep_reply.rb
@@ -3,4 +3,15 @@ class RepReply < ActiveRecord::Base
   belongs_to :reply
   belongs_to :user
   belongs_to :source_reply, :class_name => "RepReply", :foreign_key => "source_reply_id"
+  belongs_to :comment
+  after_create :send_msg
+  
+  private
+  
+  def send_msg
+    if self.reply_type =='stories'
+      SysMsg.send_to(self.comment.user,  "<a href=/users/#{self.comment.user.id}> #{self.comment.user.display_name}</a>在我对其<<<a href=/love/stories/#{self.comment.commentable.id}>房型图</a> >>所做的留言进行了回复。",:reply_type => "baicheng"   )
+    end
+    #    XXX在我对其《XXXX》所做的留言进行了回复。
+  end
 end
diff --git a/app/models/story.rb b/app/models/story.rb
index 21d1948..70ceb5f 100644
--- a/app/models/story.rb
+++ b/app/models/story.rb
@@ -10,7 +10,10 @@ class Story < ActiveRecord::Base
   belongs_to :area
   belongs_to :user
   has_one :baicheng_event
+  
   has_many :story_comments, :dependent => :destroy
+  has_many :stroy_usres
+  has_many :want_designers, :through => :stroy_usres, :source => :user #想设计的设计师
   # has_many :tags, class_name: 'StoryImageTag', :foreign_key => 'story_image_id',:dependent => :destroy
 
   after_create :sync_baicheng_event
diff --git a/app/models/story_user.rb b/app/models/story_user.rb
deleted file mode 100644
index ab7b109..0000000
--- a/app/models/story_user.rb
+++ /dev/null
@@ -1,5 +0,0 @@
-class StoryUser < ActiveRecord::Base
-  attr_accessible :story_id, :user_id, :design_time
-  belongs_to :story 
-  belongs_to :user
-end
diff --git a/app/models/sys_msg.rb b/app/models/sys_msg.rb
index f73bb8b..ad3c00d 100644
--- a/app/models/sys_msg.rb
+++ b/app/models/sys_msg.rb
@@ -1,6 +1,6 @@
 # -*- encoding : utf-8 -*-
 class SysMsg < ActiveRecord::Base
-  Status = { 0=> "new", 1 => "read" }
+  Status = { new: 0, read: 1 }
 
   MODULE = {:master_topics => "热点话题",
             :weekly_stars  => "每周之星",
@@ -20,5 +20,17 @@ class SysMsg < ActiveRecord::Base
   default_scope :order => "created_at DESC"
   
   scope :baicheng,->{where(reply_type: :baicheng)}
-
+  scope :unread,->{where(status: SysMsg::Status[:new])}
+  scope :baicheng_order,->{order('site_message_id desc')}
+  
+  
+  def self.send_to user,msg,others={}
+    SysMsg.create({:content => msg,:status => SysMsg::Status[:new], :reply_name => "系统",
+          :user_id => user.id}.merge(others) )
+  end
+  
+  def read
+   self.status =  SysMsg::Status[:read]
+   self.save
+  end
 end
diff --git a/app/models/weekly_star.rb b/app/models/weekly_star.rb
index da965ad..3782b18 100644
--- a/app/models/weekly_star.rb
+++ b/app/models/weekly_star.rb
@@ -14,8 +14,6 @@ class WeeklyStar < ActiveRecord::Base
                     :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                     :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
 
-  scope :from, where("created_at > (?)", "2013-3-1")
-
   STAR_TYPE = {
     1 => "每周之星",
     2 => "月度色彩之星",
@@ -28,9 +26,5 @@ class WeeklyStar < ActiveRecord::Base
 
   def self.get_star_type_id(arg)
     STAR_TYPE.key(arg)
-  end
-  
-  def user_id
-    author_url.scan(/(\d+)(\/designs)/) && $1 if author_url.present?
-  end
+  end                  
 end
\ No newline at end of file
diff --git a/app/views/baicheng/design_competes/index.html.erb b/app/views/baicheng/design_competes/index.html.erb
index 09881bc..3f8019d 100644
--- a/app/views/baicheng/design_competes/index.html.erb
+++ b/app/views/baicheng/design_competes/index.html.erb
@@ -47,7 +47,7 @@
 					<%- @designs.each do |design| %>
 						<li class="span2">
 							<div class="thumbnail nopadding">
-								<span class="<%= "list_tag list_tag_deal" if design.story %>"></span>
+								<span class="<%= "list_tag list_tag_deal" if false %>"></span>
 								<%= link_to image_tag(design.cover_img.try(:file).try(:url), :size =>'203x146'), design_compete_path(design), :class => 'list_img_a'  %>
 								<div class="works_tit">
 									<h5 class="nomargin">
@@ -65,4 +65,4 @@
 			</div>
 		</div>
 	</div>
-</div>
\ No newline at end of file
+</div>
diff --git a/app/views/baicheng/design_competes/show.html.erb b/app/views/baicheng/design_competes/show.html.erb
index 9991c2a..460cc50 100644
--- a/app/views/baicheng/design_competes/show.html.erb
+++ b/app/views/baicheng/design_competes/show.html.erb
@@ -1,235 +1,241 @@
 <%- content_for :head do %>
-	<%= javascript_include_tag "jquery.slider", "main" %>
-	<script type="text/javascript">
-	  $(function() {
-        $(".vote_btn_story").click(function(){
-           if($(".def_t").val()==""){
-	  		alert("评论内容不能为空哦!")
-            return false
-	  	}
-        })
-        $(".vote_btn_re").click(function(){
-           if($(".def_t_t").val()==""){
-	  		alert("回复评论内容不能为空哦!")
-            return false
-	  	}
-        })
-        $(".recommented_com").click(function(e){
-           // $(".form_comment").show()
-           $(this).parents('.review_item').next('.form_comment').show().siblings('.form_comment').hide();
-
-	  	})
-	  	$('#colors_con').hover(function(){
-		$(this).children().fadeToggle('fast');
+  <%= javascript_include_tag "jquery.slider", "main" %>
+  <script type="text/javascript">
+    $(function() {
+      $(".vote_btn_story").click(function() {
+        if ($(".def_t").val() == "") {
+          alert("评论内容不能为空哦!")
+          return false
+        }
+      })
+      $(".vote_btn_re").click(function() {
+        if ($(".def_t_t").val() == "") {
+          alert("回复评论内容不能为空哦!")
+          return false
+        }
+      })
+      $(".recommented_com").click(function(e) {
+        // $(".form_comment").show()
+        $(this).parents('.review_item').next('.form_comment').show().siblings('.form_comment').hide();
+
+      })
+      $('#colors_con').hover(function() {
+        $(this).children().fadeToggle('fast');
+      });
+
+      $(".reply_comment").click(function() {
+        $(this).parents('.review_item').find('form.reply_form').show().siblings('form.reply_form').hide();
+      });
+
+      $("a.cancel").click(function() {
+        $(this).parents('form.reply_form').hide();
+      });
     });
-    
-    $(".reply_comment").click(function(){
-			$(this).parents('.review_item').find('form.reply_form').show().siblings('form.reply_form').hide();
-		});
-                
-    $("a.cancel").click(function(){
-          $(this).parents('form.reply_form').hide();
-  });
-});
-	</script>
+  </script>
 <%- end %>
 <div class="container-fluid">
-		<div class="design_works pad_t60">
-			<div class="wrapper pr pad_b40">
-				<div class="redline_b4">
-					<div class="clearfix pad_h25">
-						<div class="w670 pull-left pr">
-							<div id="myCarousel" class="carousel works_carousel slide" style="height:367px">
-								<!-- Carousel items -->
-								<div class="carousel-inner">
-									<%- @design.design_images.each_with_index do |design,index| %>
-										<div class="<%= 'active' if index==0 %> item">
-											<a href="#">
-												<%= image_tag design.file.url(:slide) %>
-											 
-											</a>
-										</div>
-									<%- end %>
-								</div>
-								<!-- Carousel nav -->
-								<a class="carousel-control left" href="#myCarousel" data-slide="prev"><!-- &lsaquo; --></a>
-								<a class="carousel-control right" href="#myCarousel" data-slide="next"><!-- &rsaquo; --></a>
-								  <div class="carousel-indicators clearfix">
-                                                                    <%- @design.design_images.each_with_index do |design,index| %>
-                                                                      <a href="javascript:;" data-target="#myCarousel" data-slide-to="<%= index %>" class="<%= 'active' if index==0 %>"></a>
-                                                                    <% end %>
-								</div> 
-							</div>
-							<div class="btn_group btns_absolute">
-								<span class="btns btns_small btn_down">
-									<span>
-                                                                          <%= link_to votes_path(:voteable_id => @design.id, :voteable_type => "Design"),remote: true,method: 'post',title: '' do %>
-                                                                          <i class='i_icon i_icon_medium icon_like'></i> <span class='votes_countre<%= @design.id %> '><%= @design.votes_count %> </span>
-                                                                          <% end %>
-                                                                          <a href="#comments"><i class="i_icon i_icon_medium icon_review"></i><%= @design.comments.count %></a>
-									</span>
-								</span>
-							</div>
-							<div class="btn_group btns_absolute_two">
-								<%- if current_user %>
-								    <%#= link_to "收藏", user_collects_path(current_user,:story_id =>@story_id), :remote => true, method: :post, :class =>"btns btns_small btn_down nomargin i_icon i_icon_medium icon_collect" %>
-								    <a class="btns btns_small btn_down nomargin" data-method="post" data-remote="true" href="<%= user_collects_path(current_user,design_id: @design) %>">
-										<span><i class="i_icon i_icon_medium icon_collect"></i>收藏</span>
-									</a>
-								<%- else %>
-									<a class="btns btns_small btn_down nomargin" href="javascript:show_login();">
-										<span><i class="i_icon i_icon_medium icon_collect"></i>收藏</span>
-									</a>
-								<%- end %>
-								<%- if current_user %>
-									<a class="btns btns_small btn_down nomargin" href="<%= download_user_design_path(@design.user,@design) %>">
-										<span><i class="i_icon i_icon_medium icon_down"></i>下载</span>
-									</a>
-								<%- else %>
-									<a class="btns btns_small btn_down nomargin" href="javascript:show_login();">
-											<span><i class="i_icon i_icon_medium icon_down"></i>下载</span>
-									</a>
-								<%- end %>
-							</div>
-						</div>
-						<div class="w190 pull-left design_intro works_intro pr">
-							<i class="in_arrow"><img src="<%= asset_path 'baicheng/mydesign/in_arrow.png'%>"></i>
-							<h5 class="pad_h20 border_dot_b1">作品简介</h5>
-							<p class="pad_h20 border_dot_b1">
-								<span class="show"><strong>设计师：<%= @design.user.try(:username) %></strong></span>
-                                                                <span class="show"><strong>设计风格：<%= @design.design_styles.first.try(:title) %></strong></span>
-                                                                <span class="show"><strong>楼盘名称：<%= @design.try(:property_name) %></strong></span>
-                                                                <span class="show"><strong>楼盘所在地：<%= @design.city_name %></strong></span>
-							</p>
-							<div>
-								<!-- <a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a> -->
-								<%-if current_user%>
-								  <a href="<%= user_asks_path(@design.user)%>" class="design_btn ask_btn"></a>
-								<%- else %>
-								  <a href="javascript:show_login();" class="design_btn ask_btn"></a>
-								<%-end %>
-								<!-- JiaThis Button BEGIN -->
-								<div id="ckepop" class="jiathis_area share_area clearfix pull-right" style="min-width:163px;">
-									<span class="jiathis_txt">分享：</span>
-									<a class="jiathis_button_renren"></a>
-									<a class="jiathis_button_douban"></a>
-									<a class="jiathis_button_kaixin001"></a>
-									<a class="jiathis_button_tsina"></a>
-									<a class="jiathis_button_qzone"></a>
-									<!-- <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank">更多</a> -->
-									<!-- <a class="jiathis_counter_style"></a> -->
-								</div>
-								<!-- JiaThis Button END -->
-							</div>
-						</div>
-					</div>
-					<div class="divider_hori_dot"></div>
-					<div class="colorsbox clear border_bline mar_h5" style="height:82px;">
-						<img src="<%= asset_path 'baicheng/mydesign/colors_icon_tit.png'%>" style="float:left; margin:15px 15px 0 15px;" />
-						<div id="colors_con" class="colors_con" style="float:left; padding:20px 0 0; height:35px; position:relative;">
-							<img src="<%= asset_path 'baicheng/mydesign/colors2.jpg'%>" style="display: inline-block;">
-							<div class="desc" style="height: 35px; width: 590px; margin: 19px 0px; position: absolute; left: 1px; top: 1px; background-color: rgb(255, 255, 255); display: none; background-position: initial initial; background-repeat: initial initial;">
-								<div class="list" style="height:35px;">
-									<ul class="group nomargin" style="overflow:hidden;">
-                                                                          <% if @image_colors.present? %>
-                                                                            <%- @image_colors.last.each do |color| %>
-                                                                            <li>
-                                                                            <div class="colorblock" style="background-color:rgb(<%= color.rgb %>)"></div>
-                                                                            <h5><%= color.name %></h5>
-                                                                            <p>立邦(<%= color.code %>)</p>
-                                                                            </li>
-                                                                            <%- end %>
-                                                                          <% end %>
-                                                                        </ul>
-								</div>
-							</div>
-						</div>
-						<!-- <div class="pull-right">
-							<a href="#" class="shops"></a><a href="#" class="buy_pro"></a>
-						</div> -->
-						<div class="btn_group pull-right" style="margin:20px 15px 10px;">
-        						<a class="pull-left design_btn shops_btn" href="http://www.nipponpaint.com.cn/web/home/dealer_search.jsp"></a>
-							<a class="pull-left design_btn buy_btn" href="http://nipponpaint.tmall.com/shop/viewShop.htm?prt=1338961882482&prc=1"></a>
-						</div>
-						<p class="divider-vertical_nav divider-vertical_nav_long pull-right mar_h5"></p>
-					</div>
-                              
-                                        
-                                        <p class="info_place border_dot_b1 clearfix">
-                                          <strong class="pull-left" style="width:435px;">作品名称：<span class="color_red"> <%= @design.title %></span> </strong>
-                                          <% if @story %>
-                                            <strong>房型图名称： <a href="<%= story_path(@story) %>" class="underline color_red"><%=  @story.user.username   %>的房型图</a></strong>
-                                          <%end %>
-					</p>
-					<div class="mar_h20 designers space_big border_dot_b1">
-						<h5><i class="i_icon icon_tit"></i>设计理念</h5>
-                                                <p class="pad_h25"> <%= @design.content %></p>
-					</div>
-					<div class="mar_h20 designers space_big">
-						<h5><i class="i_icon icon_tit"></i>评论区</h5>
-					</div>
-                                        
-                                        <div class="reviews" id='comments'>
-					 
-					<%= form_for(Comment.new, :html => {:class => "comment-form"}) do |f| %>
-						<p class="alert alert-info"><span class="pull-right"><b>0</b>/140</span>评论 (<%= @design.comments_count %>)</p>
-						<%= f.hidden_field :commentable_id, value: @design.id %>
-                                                <%= f.hidden_field :commentable_type, value: 'Design' %>
-                                                <%= f.text_area :content, :id => "refresh-textarea", 'data-total' => '140',class: "textarea_def def_t" %>
-                                                   <div class="clearfix">
-							<button type="submit" class="pull-left vote_btn vote_btn_small  vote_btn_story nomargin noborder">提交评论</button>
-						</div>
-                                        <%- end %>
-					<div class="pr">
-						<div class="pagination pagination-right nomargin" style="position:absolute;right:0;top:-43px;">
-							<%= paginate @comments %>
-						</div>
-						<%- @comments.each do |comment| %>
-							<div class="review_item">
-								<p class="review_name"><span class="pull-right"><%= comment.created_at.to_date %></span><strong><%= comment.user ? comment.user.display_name : "匿名" %></strong></p>
-								<div class="clearfix">
-                                                                 
-                                                                  <% if signed_in? && current_user.id==@design.user.id %>
-									<span class="review_btns pull-right">
-										<a href="javascript:;" class='reply_comment'><i class="i_icon i_icon_big i_icon_review"></i>回复</a>
-									</span>
-                                                                  <% end %>
-									<p class="review_txt border_dot_b1"><%= comment.content %></p>
-								</div>
-								<%= form_for(ReplyMsg.new, :html => {:class => "reply_form clear none"}) do |f| %>
-                                                                        <%= f.hidden_field :show_id, value: @design.id %>
-                                                                        <%= f.hidden_field :comment_id, value: comment.id %>
-                                                                        <%= f.hidden_field :reply_type, value: "designs" %>
-                                                                        <%= f.text_area :content, :rows => 2, class: 'textarea_def def_t_t' %>
-                                                                        <div class="btn_group clearfix">
-										<button type="submit" class="pull-left vote_btn vote_btn_small vote_btn_re noborder">回复评论</button>
-										<a class="pull-left vote_btn vote_btn_small  vote_btn_gray noborder cancel">取消</a>
-									</div>
-			                                       <%- end %>
-
-								<%- comment.reply_msgs.order("created_at DESC").each do |reply| %>
-									<div class="nomargin">
-                                                                          <span class="review_btns pull-right">
-  									    <%= link_to  reply_msg_path(reply.id),method: :delete,title: '删除' , :confirm => "确定删除么?"  do    %>
-                                                                              <i class='i_icon i_icon_big i_icon_del'></i>删除
-                                                                             <% end  %>
-									    </span>
-                                                                          <p>
-                                                                                                                                                    	
-                                                                          <span class="color_red"><%= reply.user.display_name %></span>
-										回复说：<%= reply.content %>
-									
-									  </p>
-                                                                                </div>
-                                                                                
-								<%- end %>
-							</div>
-						<%- end %>
-						</div>
-					</div>
-                                        
-					 
-				</div>
-			</div>
-		</div>
-	</div>
\ No newline at end of file
+  <div class="design_works pad_t60">
+    <div class="wrapper pr pad_b40">
+      <div class="redline_b4">
+        <div class="clearfix pad_h25">
+          <div class="w670 pull-left pr">
+            <div id="myCarousel" class="carousel works_carousel slide" style="height:367px">
+              <!-- Carousel items -->
+              <div class="carousel-inner">
+                <%- @design.design_images.each_with_index do |design,index| %>
+                  <div class="<%= 'active' if index==0 %> item">
+                    <a href="#">
+                      <%= image_tag design.file.url(:slide) %>
+
+                    </a>
+                  </div>
+                <%- end %>
+              </div>
+              <!-- Carousel nav -->
+              <a class="carousel-control left" href="#myCarousel" data-slide="prev"><!-- &lsaquo; --></a>
+              <a class="carousel-control right" href="#myCarousel" data-slide="next"><!-- &rsaquo; --></a>
+              <div class="carousel-indicators clearfix">
+                <%- @design.design_images.each_with_index do |design,index| %>
+                  <a href="javascript:;" data-target="#myCarousel" data-slide-to="<%= index %>" class="<%= 'active' if index==0 %>"></a>
+                <% end %>
+              </div> 
+            </div>
+            <div class="btn_group btns_absolute">
+              <span class="btns btns_small btn_down">
+                <span>
+                  <%= link_to votes_path(:voteable_id => @design.id, :voteable_type => "Design"),remote: true,method: 'post',title: '' do %>
+                    <i class='i_icon i_icon_medium icon_like'></i> <abbr class='votes_countre<%= @design.id %> '><%= @design.votes_count %> </abbr>
+                  <% end %>
+                  <a href="#comments"><i class="i_icon i_icon_medium icon_review"></i><%= @design.comments.count %></a>
+                </span>
+              </span>
+            </div>
+            <div class="btn_group btns_absolute_two">
+              <%- if current_user %>
+  <%#= link_to "收藏", user_collects_path(current_user,:story_id =>@story_id), :remote => true, method: :post, :class =>"btns btns_small btn_down nomargin i_icon i_icon_medium icon_collect" %>
+                <a class="btns btns_small btn_down nomargin" data-method="post" data-remote="true" href="<%= user_collects_path(current_user,design_id: @design) %>">
+                  <span><i class="i_icon i_icon_medium icon_collect"></i>收藏</span>
+                </a>
+              <%- else %>
+                <a class="btns btns_small btn_down nomargin" href="javascript:show_login();">
+                  <span><i class="i_icon i_icon_medium icon_collect"></i>收藏</span>
+                </a>
+              <%- end %>
+              <%- if current_user %>
+                <a class="btns btns_small btn_down nomargin" href="<%= download_user_design_path(@design.user,@design) %>">
+                  <span><i class="i_icon i_icon_medium icon_down"></i>下载</span>
+                </a>
+              <%- else %>
+                <a class="btns btns_small btn_down nomargin" href="javascript:show_login();">
+                  <span><i class="i_icon i_icon_medium icon_down"></i>下载</span>
+                </a>
+              <%- end %>
+            </div>
+          </div>
+          <div class="w190 pull-left design_intro works_intro pr">
+            <i class="in_arrow"><img src="<%= asset_path 'baicheng/mydesign/in_arrow.png'%>"></i>
+            <h5 class="pad_h20 border_dot_b1">作品简介</h5>
+            <p class="pad_h20 border_dot_b1">
+              <span class="show"><strong>设计师：<%= @design.user.try(:username) %></strong></span>
+              <span class="show"><strong>设计风格：<%= @design.design_styles.first.try(:title) %></strong></span>
+              <span class="show"><strong>楼盘名称：<%= @design.try(:property_name) %></strong></span>
+              <span class="show"><strong>楼盘所在地：<%= @design.city_name %></strong></span>
+            </p>
+            <div>
+              <!-- <a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a> -->
+              <%-if current_user%>
+                <a href="<%= user_asks_path(@design.user)%>" class="design_btn ask_btn"></a>
+              <%- else %>
+                <a href="javascript:show_login();" class="design_btn ask_btn"></a>
+              <%-end %>
+              <!-- JiaThis Button BEGIN -->
+              <div id="ckepop" class="jiathis_area share_area clearfix pull-right" style="min-width:163px;">
+                <span class="jiathis_txt">分享：</span>
+                <a class="jiathis_button_renren"></a>
+                <a class="jiathis_button_douban"></a>
+                <a class="jiathis_button_kaixin001"></a>
+                <a class="jiathis_button_tsina"></a>
+                <a class="jiathis_button_qzone"></a>
+                <!-- <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank">更多</a> -->
+                <!-- <a class="jiathis_counter_style"></a> -->
+              </div>
+              <!-- JiaThis Button END -->
+            </div>
+          </div>
+        </div>
+        <div class="divider_hori_dot"></div>
+        <div class="colorsbox clear border_bline mar_h5" style="height:82px;">
+          <img src="<%= asset_path 'baicheng/mydesign/colors_icon_tit.png'%>" style="float:left; margin:15px 15px 0 15px;" />
+          <div id="colors_con" class="colors_con" style="float:left; padding:20px 0 0; height:35px; position:relative;">
+            <img src="<%= asset_path 'baicheng/mydesign/colors2.jpg'%>" style="display: inline-block;">
+            <div class="desc" style="height: 35px; width: 590px; margin: 19px 0px; position: absolute; left: 1px; top: 1px; background-color: rgb(255, 255, 255); display: none; background-position: initial initial; background-repeat: initial initial;">
+              <div class="list" style="height:35px;">
+                <ul class="group nomargin" style="overflow:hidden;">
+                  <%- color = search_color_code(@design.recommend_color_category1) %>
+                  <% if   color  %>
+                    <li>
+                      <div class="colorblock" style="background-color:rgb(<%= color.rgb %>)"></div>
+                      <h5><%= color.name %></h5>
+                      <p>
+                        <%= color.code.match(/^[F,W]M/) ? "立邦木器漆" : "立邦" %>
+                        (<%= color.code %>)<%= color.name %>                  
+                      </p>
+                    </li>
+                  <% end %>
+
+                </ul>
+              </div>
+            </div>
+          </div>
+          <!-- <div class="pull-right">
+                  <a href="#" class="shops"></a><a href="#" class="buy_pro"></a>
+          </div> -->
+          <div class="btn_group pull-right" style="margin:20px 15px 10px;">
+            <a class="pull-left design_btn shops_btn" href="http://www.nipponpaint.com.cn/web/home/dealer_search.jsp"></a>
+            <a class="pull-left design_btn buy_btn" href="http://nipponpaint.tmall.com/shop/viewShop.htm?prt=1338961882482&prc=1"></a>
+          </div>
+          <p class="divider-vertical_nav divider-vertical_nav_long pull-right mar_h5"></p>
+        </div>
+
+
+        <p class="info_place border_dot_b1 clearfix">
+          <strong class="pull-left" style="width:435px;">作品名称：<span class="color_red"> <%= @design.title %></span> </strong>
+          <% if @story %>
+            <strong>房型图名称： <a href="<%= story_path(@story) %>" class="underline color_red"><%=  @story.user.username   %>的房型图</a></strong>
+          <%end %>
+        </p>
+        <div class="mar_h20 designers space_big border_dot_b1">
+          <h5><i class="i_icon icon_tit"></i>设计理念</h5>
+          <p class="pad_h25"> <%= @design.content %></p>
+        </div>
+        <div class="mar_h20 designers space_big">
+          <h5><i class="i_icon icon_tit"></i>评论区</h5>
+        </div>
+
+        <div class="reviews" id='comments'>
+
+          <%= form_for(Comment.new, :html => {:class => "comment-form"}) do |f| %>
+            <p class="alert alert-info"><span class="pull-right"><b>0</b>/140</span>评论 (<%= @design.comments_count %>)</p>
+            <%= f.hidden_field :commentable_id, value: @design.id %>
+            <%= f.hidden_field :commentable_type, value: 'Design' %>
+            <%= f.text_area :content, :id => "refresh-textarea", 'data-total' => '140',class: "textarea_def def_t" %>
+              <div class="clearfix">
+                <button type="submit" class="pull-left vote_btn vote_btn_small  vote_btn_story nomargin noborder">提交评论</button>
+              </div>
+            <%- end %>
+            <div class="pr">
+              <div class="pagination pagination-right nomargin" style="position:absolute;right:0;top:-43px;">
+                <%= paginate @comments %>
+              </div>
+              <%- @comments.each do |comment| %>
+                <div class="review_item">
+                  <p class="review_name"><span class="pull-right"><%= comment.created_at.to_date %></span><strong><%= comment.user ? comment.user.display_name : "匿名" %></strong></p>
+                  <div class="clearfix">
+
+                    <% if signed_in? && current_user.id==@design.user.id %>
+                      <span class="review_btns pull-right">
+                        <a href="javascript:;" class='reply_comment'><i class="i_icon i_icon_big i_icon_review"></i>回复</a>
+
+                        <%= link_to  comment_path(comment),method: :delete,title: '删除' , :confirm => "确定删除么?" ,title: '' do    %>
+                          <i class='i_icon i_icon_big i_icon_del'></i>删除
+                        <% end %>
+                      </span>
+                    <% end %>
+                    <p class="review_txt border_dot_b1"><%= comment.content %></p>
+                  </div>
+                  <%= form_for(ReplyMsg.new, :html => {:class => "reply_form clear none"}) do |f| %>
+                    <%= f.hidden_field :show_id, value: @design.id %>
+                    <%= f.hidden_field :comment_id, value: comment.id %>
+                    <%= f.hidden_field :reply_type, value: "designs" %>
+                    <%= f.text_area :content, :rows => 2, class: 'textarea_def def_t_t' %>
+                      <div class="btn_group clearfix">
+                        <button type="submit" class="pull-left vote_btn vote_btn_small vote_btn_re noborder">回复评论</button>
+                        <a class="pull-left vote_btn vote_btn_small  vote_btn_gray noborder cancel">取消</a>
+                      </div>
+                    <%- end %>
+
+                    <%- comment.reply_msgs.order("created_at DESC").each do |reply| %>
+                      <div class="nomargin">
+                        <span class="review_btns pull-right">
+                          <%= link_to  reply_msg_path(reply.id),method: :delete,title: '删除' , :confirm => "确定删除么?",title: ''  do    %>
+                            <i class='i_icon i_icon_big i_icon_del'></i>删除
+                          <% end if current_user.id == @design.user.id %>
+                        </span>
+                        <p>
+
+                          <span class="color_red"><%= reply.user.display_name %></span>
+                          回复说：<%= reply.content %>
+                        </p>
+                      </div>
+
+                    <%- end %>
+                  </div>
+                <%- end %>
+              </div>
+            </div>
+
+
+          </div>
+        </div>
+      </div>
+    </div>
diff --git a/app/views/baicheng/stories/image_new.html.erb b/app/views/baicheng/stories/image_new.html.erb
index 590df25..74d3328 100644
--- a/app/views/baicheng/stories/image_new.html.erb
+++ b/app/views/baicheng/stories/image_new.html.erb
@@ -83,18 +83,12 @@
 		<!-- <form action="2.3.html" method="" class="refresh-form ft12"> -->
 			<%= form_tag(update_image_stories_path, :class=>"refresh-form ft12", :onsubmit=>"return form_valid()") do %>
 			<div class="refresh-control">
+				<label>上传图片</label>
 				<div class="form-article">
-          <p>上传您的房型图：<img src="<%=asset_path "step2-model.jpg"%>" /></p>
-          <div>
-					<!-- <p style="line-height:34px;"> -->
-          <div class="step2-upload pull-left">
+					<p style="line-height:34px;">
 						<a href="#" class="pull-left" id="upload_photo">选择图片</a>
-          </div>
-          您可将购房合同中的房型图页面扫描成图片格式或手机拍照后直接上传；<br />
-            若没有房型图？还可去<a href="http://sh.soufun.com" class="step2-archor" target="_blank">搜房网</a>查找
-						<!-- 没有房型图？去 <a href="http://sh.soufun.com" class="step2-archor" target="_blank">搜房网</a>查找 -->
+						没有房型图？去 <a href="http://sh.soufun.com" class="step2-archor" target="_blank">搜房网</a>查找
 					</p>
-        </div>
 					<p class="mt30">已经上传文件</p>
 					<div class="step2-area text-right">
 						<div class="load-bar load-content" id="uploads">
diff --git a/app/views/baicheng/stories/new.html.erb b/app/views/baicheng/stories/new.html.erb
index 486750a..20b0140 100644
--- a/app/views/baicheng/stories/new.html.erb
+++ b/app/views/baicheng/stories/new.html.erb
@@ -42,7 +42,7 @@
     style = $("[name='style[]']:checked");
     acreage = $("[name='acreage[]']:checked");
     room = $("[name='room[]']:checked");
-    fee = $("[name='fee']:checked");
+    fee = $("[name='fee[]']:checked");
 
     
     // imgCount = $(".story_image_size").text();
@@ -177,11 +177,11 @@
 				<div class="form-article upload2013-toggle checkbox2013">
 					<a href="javascript:;" class="upload2013-btn pa"></a>
 					<div class="clear none">
-						<label><input id="fee" name="fee" type="radio" value="5万-8万">5万-8万</label>
-						<label><input id="fee" name="fee" type="radio" value="8万-15万">8万-15万</label>
-						<label><input id="fee" name="fee" type="radio" value="15万-30万">15万-30万</label>
-						<label><input id="fee" name="fee" type="radio" value="30-100万">30-100万</label>
-						<label><input id="fee" name="fee" type="radio" value="100万以上">100万以上</label>
+						<label><input type="checkbox" name="fee[]" value="5万-8万">5万-8万</label>
+						<label><input type="checkbox" name="fee[]" value="8万-15万">8万-15万</label>
+						<label><input type="checkbox" name="fee[]" value="15万-30万">15万-30万</label>
+						<label><input type="checkbox" name="fee[]" value="30-100万">30-100万</label>
+						<label><input type="checkbox" name="fee[]" value="100万以上">100万以上</label>
 					</div>
 				</div>
 			</div>
diff --git a/app/views/baicheng/stories/show.html.erb b/app/views/baicheng/stories/show.html.erb
index 99df079..08538b2 100644
--- a/app/views/baicheng/stories/show.html.erb
+++ b/app/views/baicheng/stories/show.html.erb
@@ -185,6 +185,7 @@
 								<div class="thumbnail nopadding">
 									<!-- <span class="list_tag list_tag_deal"></span> -->
 									<a href="<%= design_compete_path(design) %>" class="list_img_a">
+										<%#= image_tag 'baicheng/mydesign/list1.jpg' %>
 										<%= image_tag(design.cover_img.file.url(:baicheng_list)) if design.cover_img.present? %>
 									</a>
 									<div class="works_tit border_dot_b1">
@@ -282,13 +283,9 @@
 </div>
 
 <!-- modal pops -->
-<div class="design_tips clearfix modal hide fade text-center" id="design_tips">
-	<a class="close_btn" data-dismiss="modal" aria-hidden="true" href="#">X</a><br><br>
-	<h4>小提示</h4>
-	<h5 class="mt30">您已预定了<%= @story.user.display_name %>（<%= @story.user.phone %>）的房型图</h5>
-	<p>请先<strong><em><a href="<%= download_story_path(@story) %>">下载房型图</a></em></strong>，记得15天内上传设计方案，每套户型仅接受前3套哦！<br />
-	（包含1张平面图、1张重点设计功能区立面图、1张效果图，具体参见活动<strong><a href="#" target="_blank">评比标准</a></strong>，过期视为自动放弃）<br />
-	建议：速速联系业主，上门测量后出具的设计图胜出几率更大！<br />
-	iColor特别提醒：陪同业主进店购买立邦产品，还能有话费等积分奖励哦！</p>
+<div class="design_tips clearfix modal hide fade" id="design_tips">
+	<a class="close_btn" data-dismiss="modal" aria-hidden="true" href="javascript:;">X</a><br><br>
+	<h4 class="text-center">小提示</h4>
+	<p class="text-center" style="padding:20px;">请在点击后<strong class="color_red">10</strong>天之内，上传房型图设计方案<br>（包含1张平面图、1张重点设计功能区立面图、1张效果图，具体参见活动<a href="javascript:;" class="color_red a_decration">评比标准</a>，过期视为自动放弃）<br>每个房型图仅接受<strong class="color_red">前3套</strong>设计方案，还请尽快上传设计哦！</p>
 </div>
 <!-- modal pops ends -->
\ No newline at end of file
diff --git a/app/views/baicheng/stories/update_image.html.erb b/app/views/baicheng/stories/update_image.html.erb
index 8fa815f..ef1ad9c 100644
--- a/app/views/baicheng/stories/update_image.html.erb
+++ b/app/views/baicheng/stories/update_image.html.erb
@@ -1,14 +1,28 @@
 <%- content_for :head do %>
   <%= stylesheet_link_tag "baicheng/steps.css" %>
 <%- end %>
-<div class="container-fluid step4 text-center">
+<div class="container-fluid step3">
 	<div class="container">
-		<h1>您的家装需求已提交完成！</h1>
-		<p>
-			立邦团队将于<b>3</b>天内与您联系确认以上信息，<br />
-			你将获取多家专业家装公司/设计师提交的家装创意方案，<br />
-			因爱之名 刷新生活！
-		</p>
-		<a href="<%=story_path(@story.id)%>" class="step4-btn">关闭</a>
+		<h1>step3 发布爱的宣言</h1>
+		<%= form_tag(update_title_stories_path, :class=>"refresh-form ft12") do %>
+			<div class="refresh-control">
+				<label>主题</label>
+				<div class="form-article">
+					<input type="text" maxlength="10" class="input-block-level" name="title"placeholder="<%=current_user.name ? current_user.name : current_user.username%>的房型图">
+					<span class="helper-text">不超过<b>10</b>字</span>
+				</div>
+			</div>
+			<div class="refresh-control">
+				<label style="margin-top:0;">正文</label>
+				<div class="form-article">
+					<textarea data-total="30" name="content" placeholder="美味的佳肴，清新的空气，亲密的家人……生活的每个细节都散发着幸福的味道。因爱之名，刷新生活！我要让家人更健康更舒适更快乐的生活！"></textarea>
+				</div>
+			</div>
+			<p class="text-right">
+				<input type="hidden" name="stroy_id" value="<%=params[:story_id]%>">
+				<a href="<%=image_new_story_path(params[:story_id])%>" class="steps-back pull-left">返回</a>
+				<input type="submit" class="step3-submit" value="">
+			</p>
+    <% end %>
 	</div>
 </div>
\ No newline at end of file
diff --git a/app/views/baicheng/sysinfo/index.html.erb b/app/views/baicheng/sysinfo/index.html.erb
index 4bc0902..6d8e502 100644
--- a/app/views/baicheng/sysinfo/index.html.erb
+++ b/app/views/baicheng/sysinfo/index.html.erb
@@ -12,7 +12,7 @@
             <% @msgs.each do |msg| %>
             <li class="border_dot_b1">
               <h5><%= raw msg.content %></h5>
-              <p><a class="pull-right" href="#">查看</a><%= l msg.created_at,format: :long %></p>
+              <p><a class="pull-right" href="<%= sysinfo_path(msg) %>">查看</a><%= l msg.created_at,format: :long %></p>
             </li>
             <% end %>
           </ul>
diff --git a/app/views/baicheng/welcome/index.html.erb b/app/views/baicheng/welcome/index.html.erb
index 625b558..99f1f57 100644
--- a/app/views/baicheng/welcome/index.html.erb
+++ b/app/views/baicheng/welcome/index.html.erb
@@ -6,7 +6,7 @@
 <div class="container-fluid">
   <div class="text-center">
     <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="1400" height="590">
-      <param name="movie" value="flash/icolor-yazm-v3.swf" />
+      <param name="movie" value="flash/icolor-yazm-v4.swf" />
       <param name="quality" value="high" />
       <param name="wmode" value="opaque" />
       <param name="swfversion" value="11.0.0.0" />
@@ -14,7 +14,7 @@
       <param name="expressinstall" value="Scripts/expressInstall.swf" />
       <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
       <!--[if !IE]>-->
-      <object type="application/x-shockwave-flash" data="flash/icolor-yazm-v4.swf" width="1400" height="590">
+      <object type="application/x-shockwave-flash" data="flash/icolor-yazm-v3.swf" width="1400" height="590">
         <!--<![endif]-->
         <param name="quality" value="high" />
         <param name="wmode" value="opaque" />
diff --git a/app/views/channel/access.html.erb b/app/views/channel/access.html.erb
index af6e10b..e189185 100755
--- a/app/views/channel/access.html.erb
+++ b/app/views/channel/access.html.erb
@@ -44,7 +44,7 @@
           <% user = design.user %>
             <li style="height:205px">
               <div class="clear" style="height: 155px;width:270px;overflow:hidden;">
-                <%= link_to user_design_path(user,user.designs.first), :target => "_blank" do %>
+                <%= link_to user_path(user), :target => "_blank" do %>
                   <%= image_tag(design.file.url(:list),size: '205x155', class: 'fl') rescue ""%>
                 <% end %>
                 <%= link_to user_path(user), :target => "_blank" do %>
@@ -60,7 +60,7 @@
                     target: '_blank', title: design.title rescue '' %>
               </h3>
               <p><%=user.display_name ? user.display_name : user.name%> <%="(#{user.area.name})" if user.area %></p>
-              <p><span><%= user.designs.includes(:design_images).count %></span> 作品</p>
+              <p><span><%= design.ucount %></span> 作品</p>
             </li>
           <%- end %>
         </ul><!-- channel_list end -->
diff --git a/app/views/design_images/_img_lib_tag.html.erb b/app/views/design_images/_img_lib_tag.html.erb
index 35f6c1b..266d80f 100644
--- a/app/views/design_images/_img_lib_tag.html.erb
+++ b/app/views/design_images/_img_lib_tag.html.erb
@@ -71,7 +71,13 @@
                   </div>
               </div>
           </div>
-          
+          <div class="control2013 clear">
+              <label class="label2013">
+                  推荐色号<!-- <span class="cr">*</span> -->
+              </label>
+              <input type="text" name="color1[<%=img_lib_tag.id%>]" data-provide="typeahead" class="fl inputs_count color_autocomplete" value="<%=img_lib_tag.color1%>" />
+              <p class="help-text">填写立邦推荐色号，有机会获得iColor提供的小礼物</p>
+          </div>
           <div class="control2013 clear">
               <label class="label2013">
                   调性
@@ -94,171 +100,6 @@
                   </div>
               </div>
           </div>
-          <div class="control2013 clear control2013-tips">
-            <p>选择符合此套作品的推荐色号或艺术漆效果，更可获得iColor提供的小礼物</p>
-          </div>
-          <div class="control2013 clear">
-              <label class="label2013">
-                  推荐色号
-              </label>
-              <div class="upload2013_toggle fl">
-                  <a href="javascript:;" class="upload2013_btn pa"></a>
-                  <div class="none upload2013-overflow clear">
-                      <div class="reco2013-bin clear pr">
-                          <div class="reco2013-title" title="沉稳中性 Sophisticated Neutrals">
-                              沉稳中性 Sophisticated Neutrals
-                          </div>
-                          <div class="reco2013-divider"></div>
-                          <ul class="reco2013-list">
-                            <% ColorCode::SNCOLOR.each do |sn|%>
-                              <li>
-                                  <label style="background:<%=sn[0]%>">
-                                    <% if sn[2] == img_lib_tag.color1 || sn[2] == img_lib_tag.color2 || sn[2] == img_lib_tag.color3 %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", sn[2],true %>
-                                    <% else %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", sn[2] %>
-                                    <% end %>
-                                      <p><span class="fr"><%=sn[1]%></span><%=sn[2]%></p>
-                                  </label>
-                              </li>
-                            <%  end %>
-                          </ul>
-                      </div>
-                      <div class="reco2013-bin clear pr">
-                          <div class="reco2013-title" style="background-position:0 -33px;" title="摩登单色 Modern Monochrome">
-                              摩登单色 Modern Monochrome
-                          </div>
-                          <div class="reco2013-divider"></div>
-                          <ul class="reco2013-list">
-                            <% ColorCode::MMCOLOR.each do |mm| %>
-                              <li>
-                                  <label style="background:<%=mm[0]%>">
-                                    <% if mm[2] == img_lib_tag.color1 || mm[2] == img_lib_tag.color2 || mm[2] == img_lib_tag.color3 %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", mm[2],true %>
-                                    <% else %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", mm[2] %>
-                                    <% end %>
-                                      <p><span class="fr"><%=mm[1]%></span><%=mm[2]%></p>
-                                  </label>
-                              </li>
-                            <% end %>
-                          </ul>
-                      </div>
-                      <div class="reco2013-bin clear pr">
-                          <div class="reco2013-title" style="background-position:0 -66px;" title="清新感觉 Soft Sensation">
-                              清新感觉 Soft Sensation
-                          </div>
-                          <div class="reco2013-divider"></div>
-                          <ul class="reco2013-list">
-                            <% ColorCode::SSCOLOR.each do |ss| %>
-                              <li>
-                                  <label style="background:<%=ss[0]%>">
-                                    <% if ss[2] == img_lib_tag.color1 || ss[2] == img_lib_tag.color2 || ss[2] == img_lib_tag.color3 %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", ss[2],true %>
-                                    <% else %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", ss[2] %>
-                                    <% end %> 
-                                      <p><span class="fr"><%=ss[1]%></span><%=ss[2]%></p>
-                                  </label>
-                              </li>
-                            <% end %>
-                          </ul>
-                      </div>
-                      <div class="reco2013-bin clear pr">
-                          <div class="reco2013-title" style="background-position:0 -99px;" title="轻柔质感 Crisp Blues">
-                              轻柔质感 Crisp Blues
-                          </div>
-                          <div class="reco2013-divider"></div>
-                          <ul class="reco2013-list">
-                            <% ColorCode::CBCOLOR.each do |cb| %>
-                              <li>
-                                  <label style="background:<%=cb[0]%>">
-                                    <% if cb[2] == img_lib_tag.color1 || cb[2] == img_lib_tag.color2 || cb[2] == img_lib_tag.color3 %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", cb[2],true %>
-                                    <% else %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", cb[2] %>
-                                    <% end %>
-                                      <p><span class="fr"><%=cb[1]%></span><%=cb[2]%></p>
-                                  </label>
-                              </li>
-                            <% end %>
-                          </ul>
-                      </div>
-                      <div class="reco2013-bin clear pr">
-                          <div class="reco2013-title" style="background-position:0 -132px;" title="可爱蜡笔 Pretty Pastels">
-                              可爱蜡笔 Pretty Pastels
-                          </div>
-                          <div class="reco2013-divider"></div>
-                          <ul class="reco2013-list">
-                            <% ColorCode::PPCOLOR.each do |pp| %>
-                              <li>
-                                  <label style="background:<%=pp[0]%>">
-                                    <% if pp[2] == img_lib_tag.color1 || pp[2] == img_lib_tag.color2 || pp[2] == img_lib_tag.color3 %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", pp[2],true %>
-                                    <% else %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", pp[2] %>
-                                    <% end %>
-                                      <% if pp[2] == 'GC4060-3' %>
-                                        <p style="bottom:-25px;"><%=pp[2]%> <br /><%=pp[1]%></p>
-                                      <% else %>
-                                        <p><span class="fr"><%=pp[1]%></span><%=pp[2]%></p>
-                                      <% end %>
-                                  </label>
-                              </li>
-                            <% end %>
-                          </ul>
-                      </div>
-                      <div class="reco2013-bin clear pr">
-                          <div class="reco2013-title" style="background-position:0 -165px;" title="环球风情 Global Accent">
-                              环球风情 Global Accent
-                          </div>
-                          <div class="reco2013-divider"></div>
-                          <ul class="reco2013-list">
-                            <% ColorCode::GACOLOR.each do |ag| %>
-                              <li>
-                                  <label style="background:<%=ag[0]%>">
-                                    <% if ag[2] == img_lib_tag.color1 || ag[2] == img_lib_tag.color2 || ag[2] == img_lib_tag.color3 %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", ag[2],true %>
-                                    <% else %>
-                                      <%= check_box_tag "color_name[#{img_lib_tag.id}][]", ag[2] %>
-                                    <% end %>
-                                      <% if ag[2] == 'NN4851-4' || ag[2] == 'OC1540-2'%>
-                                        <p style="bottom:-25px;"><%=ag[2]%> <br /><%=ag[1]%></p>
-                                      <% else %>
-                                        <p><span class="fr"><%=ag[1]%></span><%=ag[2]%></p>
-                                      <% end %>
-                                  </label>
-                              </li>
-                            <% end %>
-                          </ul>
-                      </div>
-                  </div>
-              </div>
-          </div>
-          <div class="control2013 clear">
-              <label class="label2013">
-                  推荐艺术漆
-              </label>
-              <div class="upload2013_toggle fl">
-                  <a href="javascript:;" class="upload2013_btn pa"></a>
-                  <div class="none clear">
-                      <ul class="reco2013-list2 clear">
-                        <% ColorCode.where("rgb is null").each do |cc|%>
-                          <li>
-                              <label>
-                                  <p><img width="38px" heigth="39px" src="<%=asset_path "color_code/#{cc.code}.png"%>"/></p>
-                                  <% if cc.code == img_lib_tag.color1 || cc.code == img_lib_tag.color2 || cc.code == img_lib_tag.color3 %>
-                                    <%= check_box_tag "color_name[#{img_lib_tag.id}][]", cc.code, true %><span><%=cc.code%></span>
-                                  <% else %>
-                                    <%= check_box_tag "color_name[#{img_lib_tag.id}][]", cc.code %><span><%=cc.code%></span>
-                                  <% end %>
-                              </label>
-                          </li>
-                        <% end %>
-                      </ul>
-                  </div>
-              </div>
-          </div>
           <div class="control2013 clear tr">  
             <a href="<%=design_image_tags_user_design_path(current_user,img_lib_tag.design,design_image_id: img_lib_tag.id)%>" target="_blank" style="color:#ff0000;font-weight:bold;margin-right:12px">+ 选择更多标签</a>  
           </div>
diff --git a/app/views/design_images/image_show.html.erb b/app/views/design_images/image_show.html.erb
index e341af6..be3e418 100644
--- a/app/views/design_images/image_show.html.erb
+++ b/app/views/design_images/image_show.html.erb
@@ -144,13 +144,13 @@ $(function(){
         </div>
       <% if @next_id %>
         <!-- <a href="<%= image_show_design_image_path(@next_id.first.id,imageable_type: params[:imageable_type],pinyin: params[:pinyin],search: params[:search],tags: params[:tags],all_tags: params[:all_tags],area_id: params[:area_id],ranking_list: params[:ranking_list], site: params[:site].to_i + 1) %>" class="slider_next">next</a> -->
-        <a href="/images/<%=@next_id.first.id%>_<%=params[:tags] ? params[:tags] : '0-0-0-0-0-0-0-0-0-0'%>-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0 %>-<%=params[:area_id] ? params[:area_id] : 0 %>-<%=params[:pinyin] ? params[:pinyin] : 0 %>-<%= params[:search] ? params[:search] : '_' %>-<%=params[:all_tags] ? params[:all_tags] : 0%>-<%=params[:site].to_i + 1%>" class="slider_next">next</a>
+        <a href="/images/<%=@next_id.first.id%>/image_show/<%=params[:tags] ? params[:tags] : '0-0-0-0-0-0-0-0-0-0'%>-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0 %>-<%=params[:area_id] ? params[:area_id] : 0 %>-<%=params[:pinyin] ? params[:pinyin] : 0 %>-<%= params[:search] ? params[:search] : '_' %>-<%=params[:all_tags] ? params[:all_tags] : 0%>-<%=params[:site].to_i + 1%>" class="slider_next">next</a>
       <% else %>
         <a class="slider_next">next</a>
       <% end %>
       <% if @up_id %>
         <!-- <a href="<%=image_show_design_image_path(@up_id.first.id,imageable_type: params[:imageable_type],pinyin: params[:pinyin],search: params[:search],tags: params[:tags],all_tags: params[:all_tags],area_id: params[:area_id],ranking_list: params[:ranking_list], site: params[:site].to_i - 1)%>" class="slider_prev">prev</a> -->
-        <a href="/images/<%=@up_id.first.id%>_<%=params[:tags] ? params[:tags] : '0-0-0-0-0-0-0-0-0-0'%>-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0 %>-<%=params[:area_id] ? params[:area_id] : 0 %>-<%=params[:pinyin] ? params[:pinyin] : 0 %>-<%= params[:search] ? params[:search] : '_' %>-<%=params[:all_tags] ? params[:all_tags] : 0%>-<%=params[:site].to_i - 1%>" class="slider_prev">prev</a>
+        <a href="/images/<%=@up_id.first.id%>/image_show/<%=params[:tags] ? params[:tags] : '0-0-0-0-0-0-0-0-0-0'%>-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0 %>-<%=params[:area_id] ? params[:area_id] : 0 %>-<%=params[:pinyin] ? params[:pinyin] : 0 %>-<%= params[:search] ? params[:search] : '_' %>-<%=params[:all_tags] ? params[:all_tags] : 0%>-<%=params[:site].to_i - 1%>" class="slider_prev">prev</a>
 
       <% else %>
         <a class="slider_prev">prev</a>
@@ -196,7 +196,7 @@ $(function(){
             </span>
             <span class="lineh40">
               <strong>设计风格：</strong>
-              <%= @image.design_style_names %>
+              <%= @image.image_styles.map(&:title).join(",") %>
             </span>
             <span>
               <strong>作品所在城市：</strong>
diff --git a/app/views/design_images/index.html.erb b/app/views/design_images/index.html.erb
index eafefd8..c4f90a6 100644
--- a/app/views/design_images/index.html.erb
+++ b/app/views/design_images/index.html.erb
@@ -95,7 +95,7 @@
 					 	<% if  (params[:page].to_i - 1) == 1 %>
 					 		//window.location = "<%=escape_javascript(raw design_images_path(imageable_type: params[:imageable_type],pinyin: params[:pinyin],search: params[:search],tags: params[:tags],all_tags: params[:all_tags],area_id: params[:area_id],ranking_list: params[:ranking_list],:return => 1)) %>"
               ///0-0-0-0-0-0-0-0-0-all-view_count-3-B-a-0-0
-                window.location = "/images/<%=params[:tags] ? params[:tags] : '0-0-0-0-0-0-0-0-0-0'%>-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0 %>-<%=params[:area_id] ? params[:area_id] : 0 %>-<%=params[:pinyin] ? params[:pinyin] : 0%>-<%=params[:search] ? params[:search] : '_'%>-<%=params[:all_tags] ? params[:all_tags] : 0%>-1"
+                window.location = "/images/<%=params[:tags] ? params[:tags] : '0-0-0-0-0-0-0-0-0-0'%>-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0 %>-<%=params[:area_id] ? params[:area_id] : 0 %>-<%=params[:pinyin] ? params[:pinyin] : 0%>-<%=params[:search] ? params[:search] : '_'%>-<%=params[:all_tags] ? params[:all_tags] : 0%>-1/0"
 					 	<% else %>
 					 		// window.location = "<%=escape_javascript(raw design_images_path(imageable_type: params[:imageable_type],pinyin: params[:pinyin],search: params[:search],tags: params[:tags],all_tags: params[:all_tags],area_id: params[:area_id],ranking_list: params[:ranking_list],:page => (@images.current_page - 1),:return => 1))%>"
               window.location = "/images/<%=params[:tags] ? params[:tags] : '0-0-0-0-0-0-0-0-0-0'%>-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0 %>-<%=params[:area_id] ? params[:area_id] : 0 %>-<%=params[:pinyin] ? params[:pinyin] : 0%>-<%=params[:search] ? params[:search] : '_'%>-<%=params[:all_tags] ? params[:all_tags] : 0%>-1/<%=@images.current_page - 1%>"
@@ -168,7 +168,7 @@
   if(search == "" || search == null){
     window.location = "/images"
   }else{
-    window.location = "/images/0-0-0-0-0-0-0-0-0-all-0-0-0-" + search + "-0-0"
+    window.location = "/images/0-0-0-0-0-0-0-0-0-all-0-0-0-" + search + "-0-0/0"
   }
 }
   </script>
@@ -193,11 +193,11 @@ $(function(){
 				</form>
 				<span>热门搜索：
 					<%- if MagicSetting.color_tag.present? %>
-						<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-<%= MagicSetting.color_tag %>-0-0"><%= MagicSetting.color_tag %></a>
+						<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-<%= MagicSetting.color_tag %>-0-0/0"><%= MagicSetting.color_tag %></a>
 					<%- end %>
-					<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-小户型-0-0">小户型</a>
-					<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-客厅-0-0">客厅</a>
-					<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-简约-0-0">简约</a>
+					<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-小户型-0-0/0">小户型</a>
+					<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-客厅-0-0/0">客厅</a>
+					<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-简约-0-0/0">简约</a>
 				</span>
 			</div>
 			<p>iColor为您提供<strong><%= @image_length%></strong>张装修图片</p>
@@ -206,10 +206,10 @@ $(function(){
 	<div class="imgbase_main pr">
 		<div class="tit_tab clear">
 			<p class="fr">
-				<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-_-0-0" class="<%="active_condition" if params[:controller] == 'design_images' && (params[:imageable_type] == nil || params[:imageable_type] == "" || params[:imageable_type] == "all") %>">所有图片</a>
-				<a href="/images/0-0-0-0-0-0-0-0-0-0-MasterDesign-0-0-0-_-0-0" class="<%="active_condition" if params[:imageable_type] == 'MasterDesign'%>">大师作品</a>
-        <a href="/images/0-0-0-0-0-0-0-0-0-0-WeekStart-0-0-0-_-0-0" class="<%="active_condition" if params[:imageable_type] == 'WeekStart'%>">设计之星</a>
-				<a href="/images/0-0-0-0-0-0-0-0-0-0-ColorDesign-0-0-0-_-0-0" class="<%="active_condition" if params[:imageable_type] == 'ColorDesign'%>">色彩配搭</a>
+				<a href="/images/0-0-0-0-0-0-0-0-0-0-all-0-0-0-_-0-0/0" class="<%="active_condition" if params[:controller] == 'design_images' && (params[:imageable_type] == nil || params[:imageable_type] == "" || params[:imageable_type] == "all") %>">所有图片</a>
+				<a href="/images/0-0-0-0-0-0-0-0-0-0-MasterDesign-0-0-0-_-0-0/0" class="<%="active_condition" if params[:imageable_type] == 'MasterDesign'%>">大师作品</a>
+        <a href="/images/0-0-0-0-0-0-0-0-0-0-WeekStart-0-0-0-_-0-0/0" class="<%="active_condition" if params[:imageable_type] == 'WeekStart'%>">设计之星</a>
+				<a href="/images/0-0-0-0-0-0-0-0-0-0-ColorDesign-0-0-0-_-0-0/0" class="<%="active_condition" if params[:imageable_type] == 'ColorDesign'%>">色彩搭配</a>
 			</p>
 			<ul id="imgbase_ul" class="fl">
 				<li class="active_tit">家装设计</li>
@@ -321,7 +321,7 @@ $(function(){
 					<span class="srch-span">地区: <i><%= @area_names %></i><a href="javascript:delete_submit_area();" class="srch-del">删除</a></span>
 				<%- end %>
 				<span class="srch-divider">|</span>
-				<button class="srch-span" onclick="javascript:window.location='/images/0-0-0-0-0-0-0-0-0-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0%>-0-0-_-0-0';">重新选择</button>
+				<button class="srch-span" onclick="javascript:window.location='/images/0-0-0-0-0-0-0-0-0-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0%>-0-0-_-0-0/0';">重新选择</button>
 			</p>
 		<%- end %>
 	</div><!-- search_bin -->
@@ -343,16 +343,12 @@ $(function(){
 						<%- @images.each do |image| %>
 							<div>
 								<div class="img_vertical_align">
-									<%- if image.imageable_type == "MasterDesign" -%>
-										<a href="<%= master_design_path(image.imageable_id) %>" target="_blank" >
-											<%= image_tag(image.file.url(:design_image_big), alt: image.design.try(:title), title: image.design.try(:title)) %>
-										</a>
-									<%- elsif image.imageable_type == "ColorDesign" -%>
-										<a href="/color_designs/<%= image.imageable_id %>" target="_blank" >
+									<%- unless image.imageable_type == "MasterDesign" -%>
+										<a href="<%= user_design_path(image.user_id, image.imageable_id, image_id: image.id) %>" target="_blank" >
 											<%= image_tag(image.file.url(:design_image_big), alt: image.design.try(:title), title: image.design.try(:title)) %>
 										</a>
-									<%- else %>
-										<a href="<%= user_design_path(image.user_id, image.imageable_id, image_id: image.id) %>" target="_blank" >
+									<%- else -%>
+										<a href="<%= master_design_path(image.imageable_id) %>" target="_blank" >
 											<%= image_tag(image.file.url(:design_image_big), alt: image.design.try(:title), title: image.design.try(:title)) %>
 										</a>
 									<%- end -%>
@@ -372,7 +368,7 @@ $(function(){
 					<%= image_tag('colors_icon_tit.png', style: 'float:left; margin-top:15px;') %>
 					<div id="colors_con" class="colors_con" style="float:left; padding:20px 0 0; height:35px; position:relative;">
 						<%= image_tag('colors2.jpg', style: 'display: inline-block;') %>
-						<div class="desc" style="height: 35px; width: 560px; margin: 19px 0px; position: absolute; left: 1px; top: 1px; background-color: rgb(255, 255, 255); display: none;">
+						<div class="desc" style="height: 35px; width: 620px; margin: 19px 0px; position: absolute; left: 1px; top: 1px; background-color: rgb(255, 255, 255); display: none;">
 							<div class="list" style="height:35px;">
 								<ul class="group" style="overflow:hidden;">
 									<%- @image_colors.first.each do |color| %>
@@ -387,9 +383,9 @@ $(function(){
 						</div>
 					</div>
 					<div class="fr ft12 btn_group btn_group_imgs border_lline">
-						<%= link_to votes_path(:voteable_id => @images.first.id, :voteable_type => "DesignImage"), :title => '', :remote => true, class: "icon_like votes_count#{@images.first.id}", :method => :post, :title => @images.first.try(:votes_count) do %>
-				           <%= @images.first.try(:votes_count) %>
-				        <%- end %>
+						<%= link_to votes_path(:voteable_id => @images.first.id, :voteable_type => "DesignImage"), :remote => true, class: "icon_like votes_count#{@images.first.id}", :method => :post do %>
+			           <%= @images.first.try(:votes_count) %>
+			         <%- end %>
 						<a href="javascript:void(0);" class="icon_view">
 			            <%= @images.first.try(:comments_count) %>
 			         </a>
@@ -401,28 +397,7 @@ $(function(){
 						<a href="http://nipponpaint.tmall.com/shop/viewShop.htm?prt=1338961882482&prc=1" target="_blank"><img src="<%= asset_path 'imgbase/tmall.jpg' %>"></a>
 						<a href="http://www.nipponpaint.com.cn/web/home/dealer_search.jsp" target="_blank"><img src="<%= asset_path 'imgbase/go_shops.jpg' %>"></a>
 					</span>
-					<%- if @images.first.imageable_type == "MasterDesign" -%>
-						<span class="fl march-twenty-a">
-							<a href="/master_designs/<%= @images.first.imageable_id %>" target="_blank">
-								<%= truncate(@images.first.imageable.try(:title), length: 15) %>
-							</a>
-								<a href="<%= user_design_path(@images.first.user_id, @images.first.imageable_id) %>" class="img_reply_btn check_imgs" target="_blank">
-									查看该套作品
-								</a>
-							
-						</span>
-						<span class="fl cl">
-							<strong>
-								<%= @images.first.imageable.master_profile.try(:name) || @images.first.imageable.master_name %>
-							</strong>
-						</span>
-					<%- elsif @images.first.imageable_type == "ColorDesign" %>
-						<span class="fl march-twenty-a">
-							<a href="/color_designs/<%= @images.first.imageable_id %>" target="_blank"><%= truncate(@images.first.try(:title), length: 15) %> </a>
-						</span>
-						<span class="fl cl">
-						</span>
-					<%- else %>
+					<%- unless @images.first.imageable_type == "MasterDesign" -%>
 						<span class="fl march-twenty-a">
 							<a href="<%= user_design_path(@images.first.user_id, @images.first.imageable_id) %>" target="_blank"><%= truncate(@images.first.design.try(:title), length: 15) %> </a>
 							<a href="<%= user_design_path(@images.first.user_id, @images.first.imageable_id) %>" class="img_reply_btn check_imgs" target="_blank">
@@ -439,6 +414,21 @@ $(function(){
 								<% end %>
 							</strong>
 						</span>
+					<%- else %>
+						<span class="fl march-twenty-a">
+							<a href="/master_designs/<%= @images.first.imageable_id %>" target="_blank">
+								<%= truncate(@images.first.imageable.try(:title), length: 15) %>
+							</a>
+								<a href="<%= user_design_path(@images.first.user_id, @images.first.imageable_id) %>" class="img_reply_btn check_imgs" target="_blank">
+									查看该套作品
+								</a>
+							
+						</span>
+						<span class="fl cl">
+							<strong>
+								<%= @images.first.imageable.master_profile.try(:name) || @images.first.imageable.master_name %>
+							</strong>
+						</span>
 					<%- end %>
 				</p>
 			</div><!-- imgbase_bin -->
@@ -453,8 +443,8 @@ $(function(){
         %>
 				<%- @images.each_with_index do |image, index| %>
 					<li data-full="<%= image.id %>" data-view="<%= image.try(:view_count) %>" class="<%= 'imgbase_curr' if index == 0 %>">
-						
-						<a href="/images/<%=image.id%>_<%=params[:tags] ? params[:tags] : '0-0-0-0-0-0-0-0-0-0'%>-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0 %>-<%=params[:area_id] ? params[:area_id] : 0 %>-<%=params[:pinyin] ? params[:pinyin] : 0 %>-<%= params[:search] ? params[:search] : '_' %>-<%=params[:all_tags] ? params[:all_tags] : 0%>-<%=site + (index + 1)%>" target="_blank">
+						<!-- <a href="<%= image_show_design_image_path(image,imageable_type: params[:imageable_type],pinyin: params[:pinyin],search: params[:search],tags: params[:tags],all_tags: params[:all_tags],area_id: params[:area_id],ranking_list: params[:ranking_list], site: site + (index + 1)) %>" target="_blank"> -->
+						<a href="/images/<%=image.id%>/image_show/<%=params[:tags] ? params[:tags] : '0-0-0-0-0-0-0-0-0-0'%>-<%=params[:imageable_type] ? params[:imageable_type] : 'all'%>-<%=params[:ranking_list] ? params[:ranking_list] : 0 %>-<%=params[:area_id] ? params[:area_id] : 0 %>-<%=params[:pinyin] ? params[:pinyin] : 0 %>-<%= params[:search] ? params[:search] : '_' %>-<%=params[:all_tags] ? params[:all_tags] : 0%>-<%=site + (index + 1)%>" target="_blank">
 							<%= image_tag(image.file.url(:design_image_list), size: '224x162', alt: image.design.try(:title), title: image.design.try(:title)) %>
 							<p><%= truncate(image.title, length: 15) %></p>
 							<span></span>
@@ -465,44 +455,38 @@ $(function(){
 								<a href="http://nipponpaint.tmall.com/shop/viewShop.htm?prt=1338961882482&prc=1" target="_blank"><img src="<%= asset_path 'imgbase/tmall.jpg' %>"></a>
 								<a href="http://www.nipponpaint.com.cn/web/home/dealer_search.jsp" target="_blank"><img src="<%= asset_path 'imgbase/go_shops.jpg' %>"></a>
 							</span>
-							<%- if @images.first.imageable_type == "MasterDesign" -%>
+							<%- unless @images.first.imageable_type == "MasterDesign" -%>
 								<span class="fl march-twenty-a">
-									<a href="/master_designs/<%= image.imageable_id %>" target="_blank">
-										<%= truncate(image.imageable.try(:title), length: 15) %>
+									<a href="<%= user_design_path(image.user_id, image.imageable_id) %>" target="_blank">
+										<%= truncate(image.design.try(:title), length: 15) %>
 									</a>
 									<a href="<%= user_design_path(@images.first.user_id, @images.first.imageable_id) %>" class="img_reply_btn check_imgs" target="_blank">
 										查看该套作品
 									</a>
-									</a>
 								</span>
 								<span class="fl cl">
 									<strong>
-										<%= image.imageable.master_profile.try(:name) || image.imageable.master_name %>
+										<%= image.user.try(:display_name) %>
+										<% if image.user %>
+											<a href="<%= user_asks_path(image.user.id) %>"  class="img_reply_btn" target="_blank">
+												免费咨询
+											</a>
+										<% end %>
 									</strong>
 								</span>
-							<%- elsif @images.first.imageable_type == "ColorDesign" -%>
-								<span class="fl march-twenty-a">
-									<a href="/color_designs/<%= image.imageable_id %>" target="_blank">
-										<%= truncate(image.try(:title), length: 15) %>
-									</a>
-								</span>
 							<%- else %>
 								<span class="fl march-twenty-a">
-									<a href="<%= user_design_path(image.user_id, image.imageable_id) %>" target="_blank">
-										<%= truncate(image.design.try(:title), length: 15) %>
+									<a href="/master_designs/<%= image.imageable_id %>" target="_blank">
+										<%= truncate(image.imageable.try(:title), length: 15) %>
 									</a>
 									<a href="<%= user_design_path(@images.first.user_id, @images.first.imageable_id) %>" class="img_reply_btn check_imgs" target="_blank">
 										查看该套作品
 									</a>
+									</a>
 								</span>
 								<span class="fl cl">
 									<strong>
-										<%= image.user.try(:display_name) %>
-										<% if image.user %>
-											<a href="<%= user_asks_path(image.user.id) %>"  class="img_reply_btn" target="_blank">
-												免费咨询
-											</a>
-										<% end %>
+										<%= image.imageable.master_profile.try(:name) || image.imageable.master_name %>
 									</strong>
 								</span>
 							<%- end %>
@@ -512,7 +496,7 @@ $(function(){
 							<%= image_tag('colors_icon_tit.png', style: 'float:left; margin-top:15px;') %>
 							<div id="colors_con" class="colors_con" style="float:left; padding:20px 0 0; height:35px; position:relative;">
 								<%= image_tag('colors2.jpg', style: 'display: inline-block;') %>
-								<div class="desc" style="height: 35px; width: 560px; margin: 19px 0px; position: absolute; left: 1px; top: 1px; background-color: rgb(255, 255, 255); display: none;">
+								<div class="desc" style="height: 35px; width: 620px; margin: 19px 0px; position: absolute; left: 1px; top: 1px; background-color: rgb(255, 255, 255); display: none;">
 									<div class="list" style="height:35px;">
 										<ul class="group" style="overflow:hidden;">
 											<%- @image_colors[index].each do |color| %>
@@ -528,7 +512,7 @@ $(function(){
 								</div>
 							</div>
 							<div class="fr ft12 btn_group btn_group_imgs border_lline">
-								<%= link_to votes_path(:voteable_id => image.id, :voteable_type => "DesignImage"), :remote => true, class: "icon_like votes_count#{image.id}", :method => :post, :title => image.try(:votes_count) do %>
+								<%= link_to votes_path(:voteable_id => image.id, :voteable_type => "DesignImage"), :remote => true, class: "icon_like votes_count#{image.id}", :method => :post do %>
 									<%= image.try(:votes_count) %>
 								<%- end %>
 								<a href="javascript:void(0);" class="icon_view">
diff --git a/app/views/designer_events/city/npyda/_page1.html.erb b/app/views/designer_events/city/npyda/_page1.html.erb
index f48866e..b2eeca0 100644
--- a/app/views/designer_events/city/npyda/_page1.html.erb
+++ b/app/views/designer_events/city/npyda/_page1.html.erb
@@ -7,7 +7,7 @@
 		<div class="section clear yda_closing">
 			<a href="javascript:void(0);"><img src="<%= asset_path 'design/pm4.jpg' %>"></a>
 			<h1>立邦亚洲青年设计师大赛(NPYDA)成功落幕</h1>
-			<p>2012年度第四届立邦亚洲青年设计师大赛（Nippon Paint Young Design Award简称：NPYDA）的颁奖典礼近日在马来西亚吉隆坡落下帷幕。本次大赛由立邦母公司立时集团(Nipsea Group)发起吸引了来自亚洲各地，如马来西亚，新加坡，泰国，越南，印度尼西亚，中国和巴基斯坦870名参赛者参加，参赛人数创历史之最。中国的设计新锐们在此次跨界亚洲的设计平台上表现出色，以精彩的创意和环保理念赢得了国际评委团的认可，来自清华大学建筑系的康思迪，以及清华美术学院环艺室内设计系的吴绍瑜分别摘得建筑设计组别白金大奖第二名和室内设计组别白金大奖第二名的殊荣。</p>
+			<p>012年度第四届立邦亚洲青年设计师大赛（Nippon Paint Young Design Award简称：NPYDA）的颁奖典礼近日在马来西亚吉隆坡落下帷幕。本次大赛由立邦母公司立时集团(Nipsea Group)发起吸引了来自亚洲各地，如马来西亚，新加坡，泰国，越�