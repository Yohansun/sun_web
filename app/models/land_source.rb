# -*- encoding: utf-8 -*-
require 'csv'
class LandSource < ActiveRecord::Base
  attr_accessible :site, :position, :code, :path
  validates_uniqueness_of :code

  def self.add_new_lands
    CSV.foreach("#{Rails.root}/lib/data/new_lands_0528.csv") do |row|
      site = row[0]
      position = row[1]
      code = row[2].scan(/\=[0-9a-z-_]+/)[0].to_s.gsub('=','')
      path = row[3]
      if LandSource.find_by_code(code) == nil
        LandSource.create(site: site, position: position, code: code, path: path)
        p "#{code} added"
      else
        p "#{code} has already been added"
      end
    end
  end

end