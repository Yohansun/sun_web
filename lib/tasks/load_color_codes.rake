desc "Load color codes"
task :load_color_codes => :environment  do
  open("#{Rails.root}/lib/data/color_codes.csv").readlines.each do |line|
    line = line.strip
    row = line.split(",")
    color_code = ColorCode.find_by_code(row[0])

    if color_code.blank?
      if row[0] =~ /^FM|^WM/
        ColorCode.create(:code => row[0])
      else
        ColorCode.create(:code => row[0], :name => row[1], :rgb => row[2,3].join(","))
      end
    end
  end
end