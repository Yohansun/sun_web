# -*- encoding : utf-8 -*-
class CubitFixture < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :fixture_area, :fixture_type, :area_id, :house_name, :pre_price

  belongs_to :area

  validates_presence_of :email, :name, :phone, :fixture_area, :fixture_type, :area_id, :house_name, :pre_price
end
