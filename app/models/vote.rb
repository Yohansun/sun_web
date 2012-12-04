class Vote < ActiveRecord::Base
  attr_accessible :voteable_id, :voteable_type
  belongs_to :voteable, :polymorphic => true
  belongs_to :user

  after_save :update_voteable_counter

  def update_voteable_counter
    self.voteable.class.increment_counter(:votes_count, self.voteable_id) if self.voteable
  end

end