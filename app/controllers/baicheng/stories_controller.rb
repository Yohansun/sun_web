# encoding: utf-8
class Baicheng::StoriesController < ApplicationController
  layout 'baicheng'

  def new
  end

  def show
  	@story = Story.find(params[:id])
  	@stories = Story.where(parent_id: @story.id).limit(3)
  end

  def download
    target_file = StoryImage.where(:story_id => params[:id])
    unless target_file.blank?
	    target_file.each do |t|
	      system("zip public/design#{params[:id]}.zip -j #{t.file.path} ")
	    end
      send_file "public/design#{params[:id]}.zip"
      # system("rm public/design#{params[:id]}.zip")
    else
      redirect_to :back
    end
  end
end
