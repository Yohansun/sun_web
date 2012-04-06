desc "Load color codes"
task :load_color_codes => :environment  do
  open("#{Rails.root}/db/color_codes.csv").readlines.each do |line|
    line = line.strip
    row = line.split(",")
    ColorCode.create(:code => row[0], :name => row[1], :rgb => row[2,3].join(","))
  end
end