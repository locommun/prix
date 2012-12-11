#!/bin/env ruby
# encoding: utf-8


class UserjoinsController < ApplicationController

  def create

    @userjoin = Userjoin.new(params[:userjoin])
    if (current_user && @userjoin.announcement.billboard.is_activated?(current_user))
      @userjoin.user = current_user
      @userjoin.save
    else
        redirect_to(request_activate_billboard_path(@userjoin.announcement.billboard), :notice => 'Du bist leider noch nicht für diese Littfaßsäule freigeschalten oder nicht eingeloggt!') 
        return
    end
    redirect_to @userjoin.announcement
  end

end