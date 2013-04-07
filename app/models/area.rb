class Area < ActiveRecord::Base
  acts_as_nested_set :counter_cache => :children_count
  #Area.rebot(省ID,[市ID])
  #Area.rebot(3198,[3213]) or Area.rebot(3198)
  scope :robot, ->(s,q=[]) { where("parent_id in (?)",q.or(select(:id).where(:parent_id => s))) }

  [:parent,:root,:province,:city,:district].each do |instance|
      class_eval <<-EOF,__FILE__,__LINE__ + 1
        delegate :name,:to => :#{instance} ,:allow_nil => true,:prefix => true
        #{next if [:parent].include?(instance)}
        delegate :id  ,:to => :#{instance} ,:allow_nil => true,:prefix => true
      EOF
    end
  
  def province
    root
  end
  
  def city
    parent_id == root_id ? self : (parent  || opstruct)
  end
  
  #主要用户判断是否为区
  def district
    parent_id == city_id ? self : opstruct
  end
  
  def cities
    province.children
  end
  
  def districts
    city.children
  end
  
  private
  def opstruct(int_id=SecureRandom.hex(6),int_name="")
    OpenStruct.new(:id => int_id,:name => int_name)
  end
end