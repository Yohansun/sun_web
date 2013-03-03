# encoding: utf-8

# -*- encoding: utf-8 -*-
desc "删除collects的脏数据"
task :delete_collect_wrong_column => :environment  do
    Collect.find_each do |collect|
      if collect.design_id
        collect.delete unless Design.exists?(collect.design_id)
        p "删除脏数据 sucess"
      elsif collect.color_design_id
        collect.delete unless ColorDesign.exists?(collect.color_design_id)
        p "删除脏数据 sucess"
      elsif collect.design_image_id
        collect.delete unless DesignImage.exists?(collect.design_image_id)
        p "删除脏数据 sucess"
      elsif collect.master_design_id
        collect.delete unless MasterDesign.exists?(collect.master_design_id)
        p "删除脏数据 sucess"
      elsif collect.inspiration_id
        collect.delete unless Inspiration.exists?(collect.inspiration_id)
        p "删除脏数据 sucess"
      elsif collect.weekly_star_id
        collect.delete unless WeeklyStar.exists?(collect.weekly_star_id)
        p "删除脏数据 sucess"
      end
    end
end