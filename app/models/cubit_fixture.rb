# -*- encoding : utf-8 -*-
class CubitFixture < ActiveRecord::Base
  attr_accessible :name, :phone, :fixture_area, :fixture_type, :area_id, :house_name, :pre_price, :style

  belongs_to :area

  validates_presence_of :name, :phone, :fixture_area, :fixture_type, :area_id, :house_name, :pre_price, :style
end
