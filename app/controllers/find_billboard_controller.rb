#!/bin/env ruby
# encoding: utf-8
class FindBillboardController < ApplicationController
  
  include Wicked::Wizard
  
steps :where, :choose , :join

  def show
    case step
      when :where
        @query= {'where' => "", 'country' => 1 , 'around' => 10}
        if session['bb']
          @query = session['bb']
        end
        
      when :join
        @billboard = Billboard.find(params[:billboard_id])
        show_billboard @billboard
     when :choose
        
        if params[:bb]
          @query = params[:bb] 
          session[:bb] =  @query
        else
          if session[:bb]
            @query = session[:bb]
          else
            redirect_to wizard_path(:where)
          end
        end
                
        if @query[:where] != ""
        
          @billboards = Billboard.near(@query[:where]+" "+@query[:country] ,@query[:around])

        else
          flash[:error] = "Bitte einen Ort, eine Postleitzahl oder eine Straße eingeben!"
          redirect_to wizard_path(:where)
          return
        end
    end
    render_wizard
  end

end