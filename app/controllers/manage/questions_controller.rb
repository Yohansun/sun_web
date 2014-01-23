# encoding: utf-8
class Manage::QuestionsController < Manage::BaseController
	cache_sweeper :home_sweeper, :only => [:create_or_update]
  def index
    @questions = Question.order("rank asc")
  end

  def create_or_update
    rank = 0
  	if params[:id] == "save"
  	  question = Question.new
      question.title = params[:title]
      question.rank = params[:rank]
      question.link = params[:link]
      question.admin_id = current_admin.id
        if question.save
          ques = Question.where("rank >= ? and created_at < ?",question.rank,question.created_at)
          ques.each do |que|
            if que.rank == 5
              que.destroy
            else
              que.rank += 1
              que.save
            end
          end
        render js: "alert('保存成功!');location.reload();"
        return
      else
        render js: "alert('保存失败!');location.reload();"
        return
      end
  	else
      question = Question.find(params[:id])
      rank = question.rank
      question.title = params[:title]
      question.rank = params[:rank]
      question.link = params[:link]
      question.admin_id = current_admin.id
      if question.save
        unless rank.to_i == params[:rank].to_i
          que = Question.where("rank = ? and updated_at < ?",question.rank,question.updated_at).first
          que.rank = rank
          que.save
        end
        render js: "alert('保存成功!');location.reload();"
        return
      else
        render js: "alert('保存失败!');location.reload();"
        return
      end
  	end

  end
end
