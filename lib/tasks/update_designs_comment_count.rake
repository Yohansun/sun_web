# -*- encoding: utf-8 -*-

desc "更新评论数"
task :update_comment_count => :environment  do
  Design.reset_column_information
  Design.find_in_batches do |group|
    sleep(50) # Make sure it doesn't get too crowded in there!
    group.each { |p| p.update_attribute :comments_count, p.comments.length }
  end
end
