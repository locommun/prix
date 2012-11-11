class CommentsController < ApplicationController

  # GET /Comments/new
  # GET /Comments/new.json
  #def new
  #  @comment = @parent.comments.build
  #end

  def create
    #@parent = Announcement.find_by_id(params[:announcement_id])
    @comment = Comment.new(params[:comment])
    if current_user
      @comment.user = current_user
    end
    
    @comment.save
    redirect_to announcement_path(@comment.announcement)
  end

end
