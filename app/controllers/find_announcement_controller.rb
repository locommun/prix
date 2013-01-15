#!/bin/env ruby
# encoding: utf-8
class FindAnnouncementController < ApplicationController
  
  include Wicked::Wizard
  
steps :where, :choose , :join

  def show
    case step
      when :where
        @query= {'where' => "", 'country' => 1 , 'around' => 10}
        if session['activity']
          @query = session['activity']
        end
        
      when :join
        @announcement = Announcement.find(params[:announcement_id])
        show_announcement @announcement
     when :choose
        
        if params[:activity]
          @query = params[:activity] 
          session[:activity] =  @query
        else
          if session[:activity]
            @query = session[:activity]
          else
            redirect_to wizard_path(:where)
          end
        end
                
        if @query[:where] != ""
        
          @billboards = Billboard.near(@query[:where]+" "+@query[:country] ,@query[:around])
          @announcements = []
          @billboards.each{
            |b| @announcements += b.announcements.to_a
          }
        else
          flash[:error] = "Bitte einen Ort, eine Postleitzahl oder eine Straße eingeben!"
          redirect_to wizard_path(:where)
          return
        end
    end
    render_wizard
  end

end