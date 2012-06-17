#encoding:utf-8
module MagicContent::StatHelper
  def area_name(key)
    name = ''
    case key
    when 'HUADONG'
      name = '华东地区'
    when 'HUANAN'
      name = '华南地区'
    when 'HUAZHONG'
      name = '华中地区'
    when 'HUABEI'
      name = '华北地区'
    when  'XIBEI'
      name = '西北地区'
    when  'XINAN'
      name = '西南地区'
    when 'DONGBEI'
      name = '东北地区'
    end
    name
  end

  def sum_count(user_type, data_type, data)
    sum = 0
    data.each do |c|
      sum += c[user_type][data_type]
    end
    sum
  end
end