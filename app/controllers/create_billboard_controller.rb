#!/bin/env ruby
# encoding: utf-8
class CreateBillboardController < ApplicationController
  
  include Wicked::Wizard
  
steps :detail , :print , :ready

  def show
    case step
      when :detail
        
        @billboard = Billboard.new
        show_billboard @billboard
        @query= {'name' => "", 'description' => "" , 'latitude' => "" ,'longitude' => "" }
        if session['community_create']
          @query = session['community_create']
        end
        
      when :print
        
        if params[:community_create]
          @query = params[:community_create] 
          session[:community_create] =  @query
        else
          if session[:community_create]
            @query = session[:community_create]
          else
            redirect_to wizard_path(:detail)
          end
        end
                
         if @query[:name] == "" || @query[:description] == "" || @query[:latitude] == "" || @query[:longitude] == ""
          flash[:error] = "Bitte Name, Lagebeschreibung und Ort angeben!"
          redirect_to wizard_path(:detail)
          return
        end
        
      when :ready
        if params[:community_create]
          @query = params[:community_create] 
          session[:community_create] =  @query
        else
          if session[:community_create]
            @query = session[:community_create]
          else
            redirect_to wizard_path(:detail)
          end
        end
          
    end
    render_wizard
  end

end