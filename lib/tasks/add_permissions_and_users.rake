# encoding: utf-8

#-*- encoding: utf-8 -*-
desc "Add E-Link and two more accounts"
task :add_permissions_and_users => :environment  do

  e_admin = create_admin('e-link')
  user01 = create_admin('user01')
  user02 = create_admin('user02')

  group = Group.create(
    name: 'e-link'
  )

  e_admin.groups = [group]

  function = Function.create(
      name: 'manage content',
    )

  group.functions = [function]

  permission1 = create_permission("manage", "Subject")
  permission2 = create_permission("create", "Subject", 0)
  permission3 = create_permission("manage", "MagicSetting")
  permission4 = create_permission("manage", "weibo_items_path")

  function.permissions = [permission1, permission2, permission3, permission4]

  group = Group.create(
    name: '客户'
  )

  group.admins = [user01, user02]

  function = Function.create(
      name: 'manage all'
    )

  group.functions = [function]

  permission1 = create_permission("manage", "all")
  permission2 = create_permission("manage", "Admin", 0)

  function.permissions = [permission1, permission2]

end

def create_admin(username)
  admin = Admin.new(
    username: username,
    email: username + '@icolor.com.cn',
    password: '123456'
  )

  admin.save!(validate: false)
  return admin
end

def create_permission(action, subject_class, can = 1)
  Permission.create(
    action: action,
    subject_class: subject_class,
    can: can
  )
end