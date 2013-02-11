#!/bin/env ruby
# encoding: utf-8
class CreateBillboardController < ApplicationController
  
  def generate_key
     #TODO: check for correktness
      if !@billboard.key 
        key = SecureRandom.hex(8)
        while Billboard.where(:key => key).first
          key = SecureRandom.hex(8)
        end
        @billboard.key = key
      end
  end
  
  before_filter :authenticate_user!
  include Wicked::Wizard

  steps :detail , :print , :ready , :save
  def show
    case step
    when :detail

      @billboard = Billboard.new
       

      if session['billboard_create']
        @billboard = Billboard.new ActiveSupport::JSON.decode session['billboard_create']
      end
      generate_map_json @billboard
    

    when :ready
      if session['billboard_create']
        @billboard = Billboard.new ActiveSupport::JSON.decode session['billboard_create']
      else
        redirect_to wizard_path(:detail)
      return
      end
    when :save
      if session['billboard_create']
        @billboard = Billboard.new ActiveSupport::JSON.decode session['billboard_create']
      else
        redirect_to wizard_path(:detail)
      return
      end
      
      @billboard.user = current_user

     
  
      @billboard.gmaps = true
      
      # now we save the object
      if @billboard.save
        session['billboard_create'] = nil
        redirect_to billboard_path(@billboard)
      return
      else
        generate_map_json @billboard
        step = :detail
        render :detail
        return
      end
    end
    render_wizard
  end

  def update
    case step
    when :print

      if params[:billboard]
        @billboard = Billboard.new params[:billboard]
        generate_key
        session['billboard_create'] =  @billboard.to_json
      else
        if session['billboard_create']
          @billboard = Billboard.new ActiveSupport::JSON.decode session['billboard_create']
        else
           generate_map_json @billboard
           step = :detail
            render :detail
            return
        end
      end
      
      if !(@billboard.valid?)
        generate_map_json @billboard
        step = :detail
        render :detail
        return
      end
    end
    render_wizard

  end

end