desc "Load designer intro"
task :load_designer_intro => :environment  do
  open("#{Rails.root}/lib/data/designer_intro.csv").readlines.each do |line|
    row = line.strip.split("#")
    MasterVideo.create(:py => row[0], :name => row[1], :intro => row[2])
  end
end