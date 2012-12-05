#!/bin/env ruby
# encoding: utf-8
class BillboardsController < ApplicationController
  def index
    @billboards = Billboard.all
    if request.location
      @user_longitude = 13.29020 #request.location.longitude
      @user_latitude= 52.45779 #request.location.latitude
      @near_billboards = Billboard.near([@user_latitude, @user_longitude], 20)
    end
    @json = Billboard.all.to_gmaps4rails

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @billboards }
    end
  end

  def description

  end

  def dialog

    @dialog = Dialog.find(params[:id])
  end
  
  def dialog_accept
    if user_signed_in?
      @dialog = Dialog.find(params[:id])
      @dialog.godfather = current_user  
      @dialog.save
    else
      flash[:notice] = "Du musst dich zuerst einloggen!"
    end
    redirect_to :controller => "billboards", :action => "dialog", :id => @dialog.id
  end

  def activate
    key = params[:key]
    billboard = Billboard.where(:key => key).first

    if Billboard.exists? billboard
      if user_signed_in?
        flash[:notice] = current_user.activate_billboard billboard
      else
        session[:billboard] = billboard.id
      end
      redirect_to billboard
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
                    :notice => 'Erfolgreich erstellt.') }
        format.json  { render :json => @billboard,
                    :status => :created, :location => @billboard }
      else
        @json = @billboard.to_gmaps4rails
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
        render :pdf => "demestoa", :no_background => false
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
                    :notice => 'Änderungen gespeichert') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @billboard.errors,
                    :status => :unprocessable_entity }
      end
    end
  end

  def request_activate
    @billboard = Billboard.find(params[:id])
    @json = @billboard.to_gmaps4rails
  end

end
