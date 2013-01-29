#!/bin/env ruby
# encoding: utf-8
class FindAnnouncementController < ApplicationController
  
  include Wicked::Wizard
  #:where
steps :choose , :join

  def show
    case step
      #when :where
       # @query= {'where' => "", 'country' => 1 , 'around' => 10}
       # if session['activity']
        #  @query = session['activity']
        #end
        
      when :join
        @announcement = Announcement.find(params[:announcement_id])
        generate_map_json @announcement
     when :choose
        
       # if params[:activity]
       #   @query = params[:activity] 
       #   session[:activity] =  @query
       # else
       #   if session[:activity]
       #     @query = session[:activity]
       #   else
       #     redirect_to wizard_path(:where)
       #   end
       # end
                
       # if @query[:where] != ""
        
       #   @billboards = Billboard.near(@query[:where]+" "+@query[:country] ,@query[:around])


       @announcements = Announcement.paginate(:page => params[:page], :per_page => 5).order('updated_at DESC')
        #@billboards = Billboard.all
        
        @announcements.each do |announcement|
          if !announcement.latitude || !announcement.longitude
            announcement.latitude = announcement.billboard.latitude
            announcement.longitude = announcement.billboard.longitude
          end
        end
        
        letters = ('A'..'Z').to_a
        @json_billboard = @announcements.to_gmaps4rails do |obj, marker|
          url = 'http://www.google.com/intl/en_ALL/mapfiles/marker_green'+ letters.delete_at(0).to_s + '.png'
          marker.json({'picture' =>  url})
        end

       
       
          #@billboards = Billboard.all
          #@announcements = []
          #@billboards.each{
          #  |b| @announcements += b.announcements.to_a
          #}
          
          
       # else
       #   flash[:error] = "Bitte einen Ort, eine Postleitzahl oder eine Straße eingeben!"
        #  redirect_to wizard_path(:where)
        #  return
       # end
    end
    render_wizard
  end

end