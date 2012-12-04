#!/bin/env ruby
# encoding: utf-8

class DialogsController < ApplicationController

  def create
    @dialog = Dialog.new(params[:dialog])
    
    if user_signed_in?
      
      dialog_old = Dialog.where(:user_id => current_user.id).first
      if (Dialog.exists? dialog_old)
        
        flash[:notice] = "Du hast bereits ein Patenschats-Gesuch auf dieser Litfaßsäule erstellt!"
        redirect_to billboard_path(@dialog.billboard)
        return
      end
      @dialog.user = current_user
    end
    
    # Check if we can save the dialog
    if @dialog.save
      
      if current_user
        redirect_to :controller=>"billboards", :action=>"dialog", :id=> @dialog.id
        flash[:notice] = "Das Patenschats-Gesuch wurde erfolgreich erstellt."
        
      else
          deny_access_to_save_object @dialog.id, "/continue_creating_dialog"
          flash[:notice] = "Nach der Anmeldung wird das Patenschats-Gesuch erstellt."
      end
      
    end
  end
  
   def finalize
    if user_signed_in? && get_stored_object
      @dialog = Dialog.find(get_stored_object)
      @dialog.user = current_user
      
      dialog_old = Dialog.where(:user_id => current_user.id).first
      if (Dialog.exists? dialog_old)
        flash[:notice] = "Du hast bereits ein Patenschats-Gesuch auf dieser Litfaßsäule erstellt!"
        redirect_to billboard_path(@dialog.billboard)
        return
      end
      
      if(@dialog.save) 
        #Remove any stored object
        clear_stored_object
        redirect_to :controller=>"billboards", :action=>"dialog", :id=> @dialog.id
        flash[:notice] = "Das Patenschats-Gesuch wurde erfolgreich erstellt."
      else
        flash[:error] = "Das Patenschats-Gesuch konnte nicht erstellt werden."
      end
      
    end  
  end
  
end
