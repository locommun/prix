#!/bin/env ruby
# encoding: utf-8


class CommentsController < ApplicationController

  # GET /Comments/new
  # GET /Comments/new.json
  #def new
  #  @comment = @parent.comments.build
  #end

  def create
    #@parent = Announcement.find_by_id(params[:announcement_id])
    @comment = Comment.new(params[:comment])
    if current_user && @comment.announcement.billboard.is_activated?(current_user)
      @comment.user = current_user
      @comment.save
    else
        redirect_to(request_activate_billboard_path(@comment.announcement.billboard), :notice => 'Du bist leider noch nicht für diese Littfaßsäule freigeschalten oder nicht eingeloggt!') 
        return
    end
    redirect_to announcement_path(@comment.announcement)
  end

end
