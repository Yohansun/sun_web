# -*- encoding: utf-8 -*-

desc "添加华讯用户"
task :add_user_huaxun => :environment  do
  user = User.new
  user.name = "花浔品味服饰"
  user.username = "huaxun"
  user.password = '12345678'
  user.types = '设计师'
  user.genre = 'huaxun'
  user.role_id = 2
  if user.save(validate: false)
    p "添加成功"
  else
    p "添加失败"
  end
end
