# -*- encoding : utf-8 -*-
desc "Load comments data"
desc "同步评论数据"
task :load_comments_data => :environment  do
  open("#{Rails.root}/lib/data/comments.csv").readlines.each do |line|
    line = line.strip
    row = line.split(",")
    puts line
    #:id => :integer,
    #:user_id => :integer,
    #:content => :string,
    #:created_at => :datetime,
    #:updated_at => :datetime,
    #:commentable_id => :integer,
    #:commentable_type => :string,
    #:votes_count => :integer

    #row[0]	id
    #row[1]	title
    #row[2]	content
    #row[3]	user_id
    #row[4]	for_id
    #row[5]	msg_type ??? {1=> design, 2=> , 3 => , 4 => }
    #row[6] parent_msg_id
    #row[9]	created_at
    user_id = User.where(:old_id => row[3]).first.try(:id)
    ctype = ""
    case row[5]
    when "0"
    	ctype = "Design"
    when "1"
    	ctype = "1"
    when "2"
    	ctype = "2"
    when "3"
    	ctype = "3"
    when "4"
    	ctype = "4"
    end
    		
    Comment.create( :user_id => user_id, :content => row[1], :created_at => row[9], 
    								:updated_at => row[9], :commentable_id => row[4], 
                    :commentable_type => ctype,
    								:votes_count => 0
                  )
  end
end