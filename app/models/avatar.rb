require "open-uri"

class Avatar < ActiveRecord::Base
  belongs_to :user
  has_attached_file :file,
    :styles => {:round => ["36x36>", :png],:upload => "155x135#", :profile => "194x194#", :greatest => "236x280#",:love_story_list => "132x156#", :icon => "48x48#", :thumb => "78x70#", :access_icon => "57x57#", :access_wall => "99x99#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :convert_options => {:round => Proc.new{self.convert_options}},
    :default_url =>  ActionController::Base.helpers.asset_path("news/regimg_bg.jpg")

  def self.convert_options
    trans = ""
    px = 20
    trans << " \\( +clone  -threshold -1 "
    trans << "-draw 'fill black polygon 0,0 0,#{px} #{px},0 fill white circle #{px},#{px} #{px},0' "
    trans << "\\( +clone -flip \\) -compose Multiply -composite "
    trans << "\\( +clone -flop \\) -compose Multiply -composite "
    trans << "\\) +matte -compose CopyOpacity -composite "
  end

  def self.load_data
    email_array = []
    User.find_each do |u|
      email_array << u.email
    end

    lines = open("#{Rails.root}/lib/data/icolor_users.csv").readlines
    lines.each do |line|
      row = line.strip.split(",")
      old_id = row[0].strip.to_i
      username = row[1].strip.gsub('"', '')
      email = row[2].strip.gsub('"', '')
      password = row[3].strip.gsub('"', '')
      created_at = row[4].strip.gsub('"', '')
      avatar = row[5].strip.gsub('"', '')
      avatar = nil if avatar == 'NULL'
      phone = row[6].strip.gsub('"', '')
      birth = row [7].strip.gsub('"', '')
      city = row[9].strip.gsub('"', '')
      #signature = row[10]
      signature = nil
      user_type = row[10].strip.gsub('"', '')
      location = row[11].strip.gsub('"', '')

      unless email_array.include? email

        case user_type
          when '1'
            designer = User.new(:old_id => old_id, :name => username, :username => username, :password => password, :email => email, :created_at => created_at, :phone => phone,
                                :date_of_birth => birth, :location => city, :signature => signature, :role_id => '1',
                                :des_status => '0', :recipient_address => location, :is_read => 'true')
            designer.save(:validate => false)
            if avatar && avatar.scan('register').size < 1
              designer_avatar = Avatar.new(:user_id => designer.id)
              file = open(avatar) rescue nil
              next unless file
              file.class.class_eval { attr_accessor :original_filename, :content_type }
              file.original_filename = avatar.split("/").last
              file.content_type = MIME::Types.type_for(file.original_filename).to_s
              designer_avatar.file = file
              designer_avatar.save
            end
          when '2'
            student = User.new(:old_id => old_id, :name => username, :username => username, :password => password, :email => email, :created_at => created_at, :phone => phone,
                               :date_of_birth => birth, :location => city, :signature => signature, :role_id => '1',
                               :des_status => '1', :recipient_address => location, :is_read => 'true')
            student.save(:validate => false)
            if avatar && avatar.scan('register').size < 1
              student_avatar = Avatar.new(:user_id => student.id)
              file = open(avatar) rescue nil
              next unless file
              file.class.class_eval { attr_accessor :original_filename, :content_type }
              file.original_filename = avatar.split("/").last
              file.content_type = MIME::Types.type_for(file.original_filename).to_s
              student_avatar.file = file
              student_avatar.save
            end
          when '3'
            person = User.new(:old_id => old_id, :name => username, :username => username, :password => password, :email => email, :created_at => created_at, :phone => phone,
                              :date_of_birth => birth, :location => city, :signature => signature, :role_id => '3',
                              :recipient_address => location, :is_read => 'true')
            person.save(:validate => false)
            if avatar && avatar.scan('register').size < 1
              person_avatar = Avatar.new(:user_id => person.id)
              file = open(avatar) rescue nil
              next unless file
              file.class.class_eval { attr_accessor :original_filename, :content_type }
              file.original_filename = avatar.split("/").last
              file.content_type = MIME::Types.type_for(file.original_filename).to_s
              person_avatar.file = file
              person_avatar.save
            end
          else
        end
        puts "load users #{username}"
      end
    end
  end
end