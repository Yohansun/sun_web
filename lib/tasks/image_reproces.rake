# -*- encoding: utf-8 -*-

desc "重新压缩图片"
task :master_profile_reproces => :environment  do
  MasterProfile.find_each{|image| image.preview_img_in.reprocess! if image.preview_img_in; p image.id}
end

task :story_image_reproces => :environment  do
  StoryImage.find_each{|image| image.file.reprocess! if image.file; p image.id}
end

desc "多线程重新压缩图片"
task :design_image_reproces => :environment  do
  # DesignImage.find_each{|image| image.file.reprocess! if image.file; p image.id}

  # 总共开启的线程数
  @thread_count = 10

  # 每个显示处理多少张图睡眠
  @sleep_time = 50

  # ids
  # arr = [54,99,207,287,364,423,514,538,635,670,763,840,914,981,71,156,229,297,383,431,520,559,644,716,792,871,930,74,160,266,308,407,433,528,594,663,734,837,886,932,92,169,285,314,417,438,531,623,667,751,839,903,971]

  @arr = DesignImage.all
  # @arr = DesignImage.where("id In (?)",arr)

  @all_size = @arr.size
  @th_num = 0
  @errors = []
  p "共启动#{@thread_count}个线程压缩#{@arr.count}张图片"

  b = lambda {
    @th_num += 1
    totle = 0
    Thread.current[:name] = @th_num
    Thread.current[:total] = 0
    Thread.current[:errors] = 0
    while @arr.size > 0
      image = @arr.pop
      if image.file
        begin
          image.file.reprocess!
          Thread.current[:total] += 1
          p "图片ID: #{image.id} 压缩完成！"
        rescue
          @errors.push image.id
          Thread.current[:errors] = @errors.count
          p "图片ID:#{image.id} 处理遇到异常："
          p $!
        end
      end
      sleep 1 if Thread.current[:total] % @sleep_time == 0
    end
    Thread.current.exit
  }

  @tg = ThreadGroup.new
  @thread_count.times { @tg.add Thread.new(&b) }

  @n = 0
  puts "线程组共有#{@tg.list.size}个线程"
  loop do
    @tg.list.each do |t|
      if t.alive?
        p "线程#{t[:name]}正在处理: 成功处理图片 #{t[:total]}张，处理失败图片 #{t[:errors]}张"
      else
        p "线程#{t[:name]}已处理完成"
        @n += 1
      end
    end
    all_processed = @all_size-@arr.size
    p "已经处理#{all_processed}/#{@all_size}张图片"
    p "有#{@errors.count}张图发生异常未被处理"
    p "异常图片id列表: #{@errors}"
    if all_processed == @all_size
      @tg.list.map { |t| t.kill }
      @tg.enclose unless @tg.enclosed?
      p "全部处理完成！"
      break
    else
      sleep 5
    end
  end

end
