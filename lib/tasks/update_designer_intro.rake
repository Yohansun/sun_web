# -*- encoding : utf-8 -*-
task :update_designer_intro => :environment  do
  open("#{Rails.root}/lib/data/designer_intro.csv").readlines.each do |line|
    row = line.strip.split("#")
    designer = MasterVideo.find_by_py(row[0].strip)
    if designer.blank?
      MasterVideo.create(:py => row[0], :name => row[1], :intro => row[2])
    end
  end
end
