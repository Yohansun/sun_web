class BaichengEvent < ActiveRecord::Base
  attr_accessible :eventable_id, :eventable_type

  belongs_to :eventable, :polymorphic => true

  scope :by_type, lambda {|type| where(eventable_type: type) }

  def story?
    self.eventable_type == Story.name
  end
end
