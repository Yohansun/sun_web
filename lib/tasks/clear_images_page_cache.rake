# -*- encoding: utf-8 -*-
desc "清除图库内页缓存"
task :clear_images_page_cache => :environment  do
  total = DesignImage.count
  puts total
  (1..total).each do |id|
    DesignImage.exipre_page_cache(id)
  end
end