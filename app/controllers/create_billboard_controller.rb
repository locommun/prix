#!/bin/env ruby
# encoding: utf-8
class CreateBillboardController < ApplicationController
  
  include Wicked::Wizard
  
steps :detail , :print , :ready , :save


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
        else
          # To print the billboard we need an object
          @billboard = Billboard.new
          @billboard.name = @query[:name]
          @billboard.description = @query[:description]
          @billboard.longitude = @query[:latitude]
          @billboard.latitude = @query[:longitude]
          
        end
        
      when :ready
          if session[:community_create]
            @query = session[:community_create]
          else
            redirect_to wizard_path(:detail)
          end
          
      when :save
          if session[:community_create]
            @query = session[:community_create]
          else
            redirect_to wizard_path(:detail)
          end
          # now we save the object
          @billboard = Billboard.new(:name => @query[:name], :description => @query[:description], :latitude => @query[:latitude], :longitude => @query[:longitude])
          @billboard.save
          
          #redirect_to billboard_path(:id => @billboard.id)
          #return
    end
    render_wizard
  end

end