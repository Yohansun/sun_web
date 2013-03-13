class BaichengEvent < ActiveRecord::Base
  attr_accessible :eventable_id, :eventable_type

  belongs_to :eventable, :polymorphic => true

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

end
