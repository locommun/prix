class CommentsController < ApplicationController
  # GET /Comments
  # GET /Comments.json
  def index
   redirect_to root_path
  end

  # GET /Comments/1
  # GET /Comments/1.json
  def show
    @Comment = Comment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Comment }
    end
  end

  # GET /Comments/new
  # GET /Comments/new.json
  def new
    @Comment = Comment.new
    @Comment.announcement_id = params[:announcement_id] 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Comment }
    end
  end

  # GET /Comments/1/edit
  def edit
    @Comment = Comment.find(params[:id])
  end

  # POST /Comments
  # POST /Comments.json
  def create
    @Comment = Comment.new(params[:Comment])

    respond_to do |format|
      if @Comment.save
        format.html { redirect_to @Comment, notice: 'Comment was successfully created.' }
        format.json { render json: @Comment, status: :created, location: @Comment }
      else
        format.html { render action: "new" }
        format.json { render json: @Comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Comments/1
  # PUT /Comments/1.json
  def update
    @Comment = Comment.find(params[:id])

    respond_to do |format|
      if @Comment.update_attributes(params[:Comment])
        format.html { redirect_to @Comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @Comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Comments/1
  # DELETE /Comments/1.json
  def destroy
    @Comment = Comment.find(params[:id])
    @Comment.destroy

    respond_to do |format|
      format.html { redirect_to Comments_url }
      format.json { head :no_content }
    end
  end
end
