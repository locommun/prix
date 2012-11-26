#!/bin/env ruby
# encoding: utf-8

class BillboardsController < ApplicationController
  def index
    @billboards = Billboard.all
    if request.location
      @user_longitude = request.location.longitude
      @user_latitude= request.location.latitude
      @near_billboards = Billboard.near([@user_latitude, @user_longitude], 20) 
    end
    @json = Billboard.all.to_gmaps4rails
   
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @billboards }
    end
  end

  

  def activate
    key = params[:key]
    if !(user_signed_in?)
      deny_access_to_save_object key 
      return
    end   
     
    if get_stored_object
        key = get_stored_object
    end
    
    if !key
       redirect_to root_path
       return
    end
    
    billboard = Billboard.where(:key => key).first
        
    if billboard
       if BillboardActivation.where(:user_id => current_user.id, :billboard_id => billboard.id).first
            flash[:notice] = "Bereits aktiviert!"
       else
            BillboardActivation.new(:user_id => current_user.id, :billboard_id => billboard.id).save
            flash[:notice] = "Erfolgreich aktiviert! Du kannst jetzt Anzeigen veröffentlichen"
       end
          redirect_to billboard_path(billboard)
     else
          flash[:error] = "Ungültiger Aktivierungscode!"
          redirect_to root_path
     end
     
   
  end

  def new
    @billboard = Billboard.new

    @json = @billboard.to_gmaps4rails
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @billboard }
    end
  end

  def create
    @billboard = Billboard.new(params[:billboard])
    if current_user
      @billboard.user = current_user
    end
    
    #TODO: check for correktness
    key = SecureRandom.hex(8)
    while Billboard.where(:key => key).first
      key = SecureRandom.hex(8)
    end
    @billboard.key = key
    
    @billboard.gmaps = true
    respond_to do |format|
      if @billboard.save
        format.html  { redirect_to(@billboard,
                    :notice => 'Billboard was successfully created.') }
        format.json  { render :json => @billboard,
                    :status => :created, :location => @billboard }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @billboard.errors,
                    :status => :unprocessable_entity }
      end
    end
  end

  def show
    @billboard = Billboard.find(params[:id])
    @json = @billboard.to_gmaps4rails
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @billboard }
      format.pdf do
        render :pdf => "file_name", :no_background => false
      end
    end
  end

  def edit
    @billboard = Billboard.find(params[:id])
    @json = @billboard.to_gmaps4rails
  end

  def update
    @billboard = Billboard.find(params[:id])

    respond_to do |format|
      if @billboard.update_attributes(params[:billboard])
        format.html  { redirect_to(@billboard,
                    :notice => 'Billboard was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @billboard.errors,
                    :status => :unprocessable_entity }
      end
    end
  end
end
