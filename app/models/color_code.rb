class ColorCode < ActiveRecord::Base
  attr_accessible :code, :name, :rgb
  belongs_to :design
end
