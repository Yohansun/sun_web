class BaichengEvent < ActiveRecord::Base
  attr_accessible :eventable_id, :eventable_type, :area_id

  belongs_to :eventable, :polymorphic => true
  belongs_to :user
  belongs_to :story, class_name: 'Story', :foreign_key => 'eventable_id'
  belongs_to :design, class_name: 'Design', :foreign_key => 'eventable_id'

  scope :by_type, lambda {|type| where(eventable_type: type) }

  def story?
    self.eventable_type == Story.name
  end

  def self.search_by_area(area_id)
    area = Area.find(area_id)
    areas = area.self_and_descendants
    BaichengEvent.scoped.where(["area_id in (?)", areas.map(&:id)])
  end

  def self.find_by_design(design_id)
    BaichengEvent.where(["eventable_id = ? and eventable_type = ?", design_id, Design.name])
  end

  def self.story_type(area_id)
    area_arr_id = Area.where(parent_id: area_id).map &:id
    area_arr_id = area_arr_id.join(",")
    BaichengEvent.where("area_id in (#{area_arr_id}) and eventable_type = 'Story'").limit(6)
  end

  def self.design_type(area_id)
    area_arr_id = Area.where(parent_id: area_id).map &:id
    area_arr_id = area_arr_id.join(",")
    BaichengEvent.where("area_id in (#{area_arr_id}) and eventable_type = 'Design'").limit(6)
  end

  def self.baicheng_map_design(area_id)
    area_arr_id = Area.where(parent_id: area_id).map &:id
    area_arr_id = area_arr_id.join(",")
    BaichengEvent.where("area_id in (#{area_arr_id}) and eventable_type = 'Design'").limit(12)
  end

  def self.baicheng_map_story(area_id)
    area_arr_id = Area.where(parent_id: area_id).map &:id
    area_arr_id = area_arr_id.join(",")
    BaichengEvent.where("area_id in (#{area_arr_id}) and eventable_type = 'Story'").limit(12)
  end

end
