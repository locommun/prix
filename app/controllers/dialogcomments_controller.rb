#!/bin/env ruby
# encoding: utf-8


class DialogcommentsController < ApplicationController

  def create

    @dialogcomment = Dialogcomment.new(params[:dialogcomment])
    if (current_user && @dialogcomment.dialog.billboard.is_activated?(current_user)) || (current_user && @dialogcomment.dialog.user_id == current_user.id)
      @dialogcomment.user = current_user
      @dialogcomment.save
    else
        redirect_to(request_activate_billboard_path(@dialogcomment.dialog.billboard), :notice => 'Du bist leider noch nicht für diese Littfaßsäule freigeschalten oder nicht eingeloggt!') 
        return
    end
    redirect_to :controller => "billboards", :action => "dialog", :id => @dialogcomment.dialog.id
  end

end