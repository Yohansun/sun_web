# -*- encoding: utf-8 -*-

desc "图库权限"
task :img_lib_permissions => :environment  do
  edit_album_funtion = Function.create(name: '编辑相册')
  edit_album_funtion.permissions.create(action: 'edit', subject_class: 'album')

  set_details_funtion = Function.create(name: '设置详情')
  set_details_funtion.permissions.create(action: 'set_details', subject_class: 'details')

  settings_tab_funtion = Function.create(name: '设置标签')
  settings_tab_funtion.permissions.create(action: 'settings', subject_class: 'tab')

  set_color_function = Function.create(name: '设置色号')
  set_color_function.permissions.create(action: 'set', subject_class: 'color')

  audit_function = Function.create(name: '审核')
  audit_function.permissions.create(action: 'audit', subject_class: 'aud')

  del_function = Function.create(name: '删除')
  del_function.permissions.create(action: 'delete', subject_class: 'del')

  image_function = Function.create(name: '图库管理')
  image_function.permissions.create(action: 'manage', subject_class: 'image_libraries_path')

  manage_content = Function.find(1)

  group_a = Group.create(name: '权限A')
  group_a.functions = [edit_album_funtion, set_details_funtion, settings_tab_funtion, del_function,image_function,manage_content]
  group_b = Group.create(name: '权限B')
  group_b.functions = [edit_album_funtion, settings_tab_funtion, audit_function, del_function,image_function,manage_content]
  group_c = Group.create(name: '权限C')
  group_c.functions = [set_color_function, del_function,image_function,manage_content]
end