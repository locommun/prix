#!/bin/env ruby
# encoding: utf-8


class BringthingsController < ApplicationController

  def create

    @bringthing = Bringthing.new(params[:bringthing])
    
    if (current_user && @bringthing.announcement.billboard.is_activated?(current_user))
        @bringthing.user = current_user
        @bringthing.save
    else
        redirect_to(request_activate_billboard_path(@bringthing.announcement.billboard), :notice => 'Du bist leider noch nicht für diese Littfaßsäule freigeschalten oder nicht eingeloggt!') 
        return
    end
    redirect_to @bringthing.announcement
  end

end