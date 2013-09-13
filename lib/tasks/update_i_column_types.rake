# -*- encoding : utf-8 -*-
desc "后台通栏排序改名字"
task :update_i_column_types => :environment  do
  i_column_types = IColumnType.order("id asc")
  i_column_types.each do |type|
    if type.id == 16
      type.rank = 17
      type.name = "精彩资讯"
    elsif type.id == 17
      type.rank = 16
    else
      type.rank = type.id
    end
    type.save
  end
end