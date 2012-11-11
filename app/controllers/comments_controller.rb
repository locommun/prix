class CommentsController < ApplicationController
  # GET /Comments
  # GET /Comments.json
  def index
   redirect_to root_path
  end

  # GET /Comments/1
  # GET /Comments/1.json
  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /Comments/new
  # GET /Comments/new.json
  def new
    @comment = Comment.new
    @comment.announcement_id = params[:announcement_id] 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /Comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /Comments
  # POST /Comments.json
  def create
    @comment = Comment.new(params[:comment])
    if current_user
     @comment.user = current_user
    end
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.announcement, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Comments/1
  # PUT /Comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment.announcement, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Comments/1
  # DELETE /Comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to Comments_url }
      format.json { head :no_content }
    end
  end
end
