# -*- encoding : utf-8 -*-
desc "Load weibo data"
desc "同步微博数据"
task :weibo_minisite_data => :environment  do
  weibo_data = []
  (1..4).each do |i|
    data = Mood.get_weibo(i)
    weibo_data += data['statuses']
  end
  articles = weibo_data.uniq
  articles.each do |article|
    areas = article['user']['location'].split(" ")
    area =  Area.where("name like '%#{areas.last}%'")
    if area.present?
      area_id = area.first.id
    else
      area_id = 0
    end
    love_sotry = LoveStory.where(sina_id: article['id'])
    unless love_sotry.present?
      p article['id']
      LoveStory.create(content: article['text'],user_id: nil,area_id: area_id,user_name: article['user']['name'],come_from: 'sina', sina_id: article['id'])
    end
  end
end