# encoding: utf-8
class Manage::HomeRecommendsController < Manage::BaseController

	def index
		@recommends = HomeRecommend.order("position")
	end

	def edit_recommend
		@recommend = HomeRecommend.find(params[:recommend_id])

		respond_to do |format|
			format.js
		end
	end

	def update_recommend
		if params[:id].present?
			@recommend = HomeRecommend.find(params[:id])
			if @recommend.position == params[:position]
				@recommend.update_attributes(title: params[:title], url: params[:url])
			else
				HomeRecommend.find_by_position(params[:position]).update_attribute(:position,@recommend.position)
				@recommend.update_attributes(position: params[:position], title: params[:title], url: params[:url])
			end
		end
		render js: "alert('保存成功!');location.reload();"
	end

	def insert_recommend
		if params[:position] && params[:title] && params[:url]
			HomeRecommend.find_each {|a| a.increment!(:position)}
			last = HomeRecommend.order("position").last
			if last.present?
				last.destroy
			end
			recommend = HomeRecommend.find_by_position(params[:position])
			if recommend.present?
				recommend.destroy
			end
			HomeRecommend.create(position: params[:position], title: params[:title], url: params[:url])
		end
		render js: "alert('保存成功!');location.reload();"
	end

	def delete_last
		@recommends = HomeRecommend.order("position")
		respond_to do |format|
			format.js
		end
	end
end
