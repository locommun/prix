#!/bin/env ruby
# encoding: utf-8
class FindBillboardController < ApplicationController
  
  include Wicked::Wizard
  
  #:where
steps :choose , :join

  def show
    case step
      #when :where 
        #@query= {'where' => "", 'country' => 1 , 'around' => 10}
        #if session['community']
          #@query = session['community']
        #end
        
      when :join
        @billboard = Billboard.find(params[:billboard_id])
        generate_map_json @billboard
     when :choose
        
        #if params[:community]
          #@query = params[:community] 
          #session[:community] =  @query
        #else
          #if session[:community]
            #@query = session[:community]
          #else
            #redirect_to wizard_path(:where)
            #redirect_to wizard_path(:choose)
          #end
        #end
                
        #if @query[:where] != ""
        
          #@billboards = Billboard.near(@query[:where]+" "+@query[:country] ,@query[:around])
         
         @billboards = Billboard.paginate(:page => params[:page], :per_page => 10)
        #@billboards = Billboard.all
        
        letters = ('A'..'Z').to_a
        @json_billboard = @billboards.to_gmaps4rails do |obj, marker|
          url = 'http://www.google.com/intl/en_ALL/mapfiles/marker_green'+ letters.delete_at(0).to_s + '.png'
          marker.json({'picture' =>  url})
        end

       
        #else
          #flash[:error] = "Bitte einen Ort, eine Postleitzahl oder eine Straße eingeben!"
          #redirect_to wizard_path(:where)
          #redirect_to wizard_path(:choose)
          #return
        #end
    end
    render_wizard
  end

end