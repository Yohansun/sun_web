# -*- encoding: utf-8 -*-
desc "初始化设计师活动banner数据"
task :init_activities_banners => :environment  do
  banner1 = IBanner.where(page_name: '设计师活动')
  if banner1.blank?
    IBanner.transaction do
      IBanner.create(page_name: '设计师活动',position: 1, size: '230x230')
      IBanner.create(page_name: '设计师活动',position: 2, size: '230x170')
      IBanner.create(page_name: '设计师活动',position: 3, size: '230x230')
      IBanner.create(page_name: '设计师活动',position: 4, size: '230x230')
      IBanner.create(page_name: '设计师活动',position: 5, size: '670x85')
      IBanner.create(page_name: '设计师活动',position: 6, size: '310x85')
    end
  end

  banner2 = IBanner.where(page_name: '其它活动')
  if banner2.blank?
    IBanner.transaction do
      IBanner.create(page_name: '其它活动',position: 1, size: '230x230')
      IBanner.create(page_name: '其它活动',position: 2, size: '230x170')
      IBanner.create(page_name: '其它活动',position: 3, size: '230x230')
      IBanner.create(page_name: '其它活动',position: 4, size: '230x230')
      IBanner.create(page_name: '其它活动',position: 5, size: '670x85')
      IBanner.create(page_name: '其它活动',position: 6, size: '310x85')
    end
  end

  banner3 = IBanner.where(page_name: '设计师活动内页')
  if banner3.blank?
    IBanner.transaction do
      IBanner.create(page_name: '设计师活动内页',position: 1, size: '230x230')
      IBanner.create(page_name: '设计师活动内页',position: 2, size: '230x170')
      IBanner.create(page_name: '设计师活动内页',position: 3, size: '230x230')
      IBanner.create(page_name: '设计师活动内页',position: 4, size: '230x230')
      IBanner.create(page_name: '设计师活动内页',position: 5, size: '670x85')
      IBanner.create(page_name: '设计师活动内页',position: 6, size: '310x85')
    end
  end

  banner4 = IBanner.where(page_name: '其它活动内页')
  if banner4.blank?
    IBanner.transaction do
      IBanner.create(page_name: '其它活动内页',position: 1, size: '230x230')
      IBanner.create(page_name: '其它活动内页',position: 2, size: '670x85')
      IBanner.create(page_name: '其它活动内页',position: 3, size: '230x170')
      IBanner.create(page_name: '其它活动内页',position: 4, size: '230x230')
      IBanner.create(page_name: '其它活动内页',position: 5, size: '670x85')
      IBanner.create(page_name: '其它活动内页',position: 6, size: '310x85')
    end
  end

  #初始化设计鉴赏banner数据
  banner5 = IBanner.where(page_name: '设计之星')
  if banner5.blank?
    IBanner.transaction do
      IBanner.create(page_name: '设计之星',position: 1, size: '1000x85')
      IBanner.create(page_name: '设计之星',position: 2, size: '230x230')
      IBanner.create(page_name: '设计之星',position: 3, size: '670x85')
      IBanner.create(page_name: '设计之星',position: 4, size: '310x85')
      IBanner.create(page_name: '设计之星',position: 5, size: '230x170')
      IBanner.create(page_name: '设计之星',position: 6, size: '230x230')
      IBanner.create(page_name: '设计之星',position: 7, size: '670x85')
      IBanner.create(page_name: '设计之星',position: 8, size: '310x85')
    end
  end

  banner6 = IBanner.where(page_name: '作品展示')
  if banner6.blank?
    IBanner.transaction do
      IBanner.create(page_name: '作品展示',position: 1, size: '670x85')
      IBanner.create(page_name: '作品展示',position: 2, size: '310x85')
      IBanner.create(page_name: '作品展示',position: 3, size: '230x230')
      IBanner.create(page_name: '作品展示',position: 4, size: '230x170')
      IBanner.create(page_name: '作品展示',position: 5, size: '230x230')
      IBanner.create(page_name: '作品展示',position: 6, size: '670x85')
      IBanner.create(page_name: '作品展示',position: 7, size: '310x85')
    end
  end

  banner7 = IBanner.where(page_name: '色彩配搭')
  if banner7.blank?
    IBanner.transaction do
      IBanner.create(page_name: '色彩配搭',position: 1, size: '670x85')
      IBanner.create(page_name: '色彩配搭',position: 2, size: '310x85')
      IBanner.create(page_name: '色彩配搭',position: 3, size: '230x230')
      IBanner.create(page_name: '色彩配搭',position: 4, size: '230x170')
      IBanner.create(page_name: '色彩配搭',position: 5, size: '230x230')
      IBanner.create(page_name: '色彩配搭',position: 6, size: '670x85')
      IBanner.create(page_name: '色彩配搭',position: 7, size: '310x85')
    end
  end

  banner8 = IBanner.where(page_name: '设计之星内页')
  if banner8.blank?
    IBanner.transaction do
      IBanner.create(page_name: '设计之星内页',position: 1, size: '1000x85')
      IBanner.create(page_name: '设计之星内页',position: 2, size: '230x170')
      IBanner.create(page_name: '设计之星内页',position: 3, size: '230x230')
      IBanner.create(page_name: '设计之星内页',position: 4, size: '670x85')
      IBanner.create(page_name: '设计之星内页',position: 5, size: '310x85')
    end
  end

  banner_design_show = IBanner.where(page_name: '作品展示内页')
  if banner_design_show.blank?
    IBanner.transaction do
      IBanner.create(page_name: '作品展示内页',position: 1, size: '1000x85')
      IBanner.create(page_name: '作品展示内页',position: 2, size: '230x170')
      IBanner.create(page_name: '作品展示内页',position: 3, size: '230x230')
      IBanner.create(page_name: '作品展示内页',position: 4, size: '670x85')
      IBanner.create(page_name: '作品展示内页',position: 5, size: '310x85')
    end
  end

  color_designs_show = IBanner.where(page_name: '色彩配搭内页')
  if color_designs_show.blank?
    IBanner.transaction do
      IBanner.create(page_name: '色彩配搭内页',position: 1, size: '1000x85')
      IBanner.create(page_name: '色彩配搭内页',position: 2, size: '230x170')
      IBanner.create(page_name: '色彩配搭内页',position: 3, size: '230x230')
      IBanner.create(page_name: '色彩配搭内页',position: 4, size: '670x85')
      IBanner.create(page_name: '色彩配搭内页',position: 5, size: '310x85')
    end
  end

  #初始化其它页面banner数据
  banner9 = IBanner.where(page_name: '登录/注册/找回密码')
  if banner9.blank?
    IBanner.transaction do
      IBanner.create(page_name: '登录/注册/找回密码',position: 1, size: '230x170')
      IBanner.create(page_name: '登录/注册/找回密码',position: 2, size: '670x85')
      IBanner.create(page_name: '登录/注册/找回密码',position: 3, size: '310x85')
    end
  end

  banner10 = IBanner.where(page_name: '作品上传')
  if banner10.blank?
    IBanner.transaction do
      IBanner.create(page_name: '作品上传',position: 1, size: '670x85')
      IBanner.create(page_name: '作品上传',position: 2, size: '310x85')
    end
  end
end