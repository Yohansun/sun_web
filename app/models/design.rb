# encoding: utf-8

require 'open-uri'

class Design < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :city, :content, :room_type, :style, :title, :design_image_ids,
    :tag_list, :area_id, :reason, :user_id, :view_count, :recommended, :design_color,
    :recommend_color_category1, :is_yda, :is_refresh, :property_name, :speech, :story_talking_id
  validates_presence_of :title, :area_id, :property_name

  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
  has_many :design_images, :as => :imageable, :dependent => :delete_all, :order => 'is_cover DESC'
  has_many :color_codes
  has_many :collects, :dependent => :destroy
  has_many :design_tags,:class_name => "DesignTags"
  has_many :design_styles, :through => :design_tags,:source => :image_library_category,:conditions => ["image_library_categories.parent_id = 34"]
  belongs_to :story, :counter_cache => true

  has_one :baicheng_event
  #最新的一张作品图片
  has_one :cover_img,:as => :imageable,:class_name => "DesignImage",:order => "design_images.created_at desc"
  belongs_to :area

  scope :time_range, ->(start_date,end_date){joins(:user).where(:users => {:role_id => 1,:des_status => true,:source => nil},:created_at => start_date.to_time..end_date.to_time)}
  scope :baicheng,->{where(baicheng_active: true)}

  paginates_per 8

  after_create :update_user_design_code_count
  after_create :send_baicheng_sys_msg
  #after_update :sync_baicheng_event
  before_destroy :clear_baicheng_event
  
  def design_style_names
    design_styles.map(&:title).join(',')
  end

  def design_style_names  
    design_styles.map(&:title).join(',')  
  end  

  #更新用户上传作品数色号（权重）。片区快查用
  def update_user_design_code_count
    unless self.recommend_color_category1.blank?
      self.user.increment!(:recommend_designer_status)
    end
  end

  def city_name
    if self.area_id && self.area_id != 0
      area = Area.find(area_id)
      return area.parent.name
    end
  end

  def location
    if self.area_id && self.area_id != 0
      area = Area.find(area_id)
      if area.parent.name == area.parent.parent.name
        area.parent.name + " " + area.name
      else
        area.parent.parent.name + " " + area.parent.name + " " + area.name
      end
    end
  end

  def comments_count
    self.comments.size
  end

  def self.load_old_data
    OldDesign.all.each do |old|
      user = User.find_by_old_id(old.user_id)
      next unless user
      tags = old.tags.gsub('，', ',') if old.tags
      design = Design.create(user_id: user.id, title: old.title, content: old.title, view_count: old.view_count,
        style: old.style, recommended: old.recommended, tag_list: tags)
      p design
      OldDesignFile.where(:old_design_id => old.id).all.each do |file|
        image = DesignImage.new
        image.user_id = user.id
        image.imageable = design
        image.is_cover = file.is_cover
        handle = open(file.src) rescue nil
        next unless image.file
        handle.class.class_eval { attr_accessor :original_filename, :content_type }
        handle.original_filename = file.src.split("/").last
        image.file = handle

        image.save
      end
    end
  end

  # def sync_baicheng_event
  #   if self.baicheng_active.present? && self.baicheng_active == true
  #     BaichengEvent.create(eventable_id: self.id, eventable_type: Design.name, area_id: self.area_id)
  #   end
  # end

  
  def clear_baicheng_event
    BaichengEvent.find_by_design(self.id).try(:destroy_all)
  end

  private
  def send_baicheng_sys_msg
    if self.story
      SysMsg.send_to(self.story.user,"设计师<a href=/users/#{self.user.id} >#{self.user.display_name}</a>对我发布的《<a href=/love/stories/#{self.story.id}>房型图</a>》上传了设计。",
        {:reply_type => "baicheng",:re_url=>"/love/stories/#{self.story.id}"})
      ##TODO （比如：想要设计的作品，已上传的作品数量变更）
      self.story.want_designers.each do |user|
        SysMsg.send_to(user,"您的<a href=/love/stories/act >个人活动主页</a>有最新信息更新，快去查看。",
          {:reply_type => "baicheng",:re_url =>"/love/stories/act",site_message_id: 123}) unless user==self.user
      end
    end
  end
end
