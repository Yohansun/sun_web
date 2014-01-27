#encoding: utf-8
class Manage::DialogCelebrities::CelebrityQuestionsController < Manage::BaseController
  def index
    @boards = CelebrityContentBoard.first(5)
    @board_id = params[:board_id] ? params[:board_id].to_i : 1
    @board = @boards[ @board_id - 1 ]
  end

  def save_board_name
    if request.post?
      board = CelebrityContentBoard.find(params[:board_id])
      board.name = params[:board_name]
      render :json => { :code => board.save ? 1 : -1 }
    end
  end

  def create_board_scope
    if request.post?
      board = CelebrityContentBoard.find(params[:board_id])
      scope = CelebrityQuestionKeyScope.new
      scope.celebrity_content_board_id = board.id
      if scope.save
        render :json => {:code => 1, :scope_id => scope.id }
      else
        render :json => {:code => 0, :notify => scope.errors.full_messages }
      end
    end
  end

  def destroy_board_scope
    if request.post?
      scope = CelebrityQuestionKeyScope.find(params[:scope_id])
      if scope.present?
        scope.destroy
        render :json => {:code => 1 }
      end
    end
  end

  def update_board_scope
    if request.post?
      scope = CelebrityQuestionKeyScope.find(params[:scope_id])
      if scope.present?
        scope.name = params[:scope_name]
        scope.key_arr = params[:scope_key].split(/,|，/)
        if scope.save
          render :json => {:code => 1 }
        else
          render :json => {:code => 0 , :notify => scope.errors.full_messages }
        end
      end
    end
  end
end
