#encoding: utf-8
class Manage::DialogCelebrities::MediaController < Manage::BaseController
  def index
    @media_list = Media.order("id desc")
  end

  def create_media
    if request.post?
      @media = Media.new
      @media.name = "新媒体#{Time.now.to_i}"
      @media.username = "newmedia#{Time.now.to_i}"
      @media.password = "888888"
      @media.encrypt_password!
      @media.boards = {}
      @media.save
      boards = CelebrityContentBoard.first(5)
      render :json => {:code => 1, :content => render_to_string(:partial => "manage/dialog_celebrities/media/new_media",:locals=>{ boards: boards, media: @media  }) }
    end
  end

  def destroy_media
    if request.post?
      media = Media.find(params[:media_id])
      if media.present?
        media.destroy
        render :json => {:code => 1 }
      end
    end
  end

  def update_media
    if request.post?

      media = Media.find(params[:media_id])
      if media.present?
        media.name     = params[:name]
        media.username = params[:username]
        media.email    = params[:email]
        media.mobile   = params[:mobile]
        _boards = params[:boards].split("_")
        boards  = CelebrityContentBoard.where("id in (?)",_boards.map(&:to_i))
        board_names  = boards.map(&:name)
        media.boards = boards.inject({}){ |a,b| a[b.id] = b.name; a  }
        # 未分类的处理
        if _boards.include? "0"
          board_names.push "未分类"
          media.boards[0] = "未分类"
        end
        media.save
        if params[:password].length < 32
          media.password = params[:password]
          media.encrypt_password!
          media.save
        end
        render :json => {:code => 1 , :boards => board_names.join("   ")}
      end
    end
  end
end
