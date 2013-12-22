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
end
