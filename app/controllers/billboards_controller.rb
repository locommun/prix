#!/bin/env ruby
# encoding: utf-8
class BillboardsController < ApplicationController
  def index

    #@user_longitude = 13.29020 #request.location.longitude
    #@user_latitude= 52.45779 #request.location.latitude
    #@near_billboards = Billboard.all#Billboard.near([@user_latitude, @user_longitude], 20)
  end

  def description
  end

  def godfather_form
    @billboard = Billboard.find(params[:id])
    generate_map_json @billboard
  end

  def activate_form
    @billboard = Billboard.find(params[:id])
    generate_map_json @billboard
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

  def from_session
    if session['billboard_create']
      @billboard = Billboard.new ActiveSupport::JSON.decode session['billboard_create']
      respond_to do |format|
        format.json  { render :json => @billboard }
        format.pdf do
          render :template => "billboards/show.pdf.erb", :pdf => "locommun", :no_background => false
        end
      end
    else
      redirect_to root_path
    end

  end

  def show

    @billboard = Billboard.find(params[:id])
    generate_map_json @billboard

    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @billboard }
      format.pdf do
        render :pdf => "locommun", :no_background => false
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
        format.html  { redirect_to(billboard_path(@billboard)) }
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
    generate_map_json @billboard
    @json2 = @billboard.to_gmaps4rails
  end

  def contactsend
    @contact = params[:contact]
    Contact.contact(@contact[:email], @contact[:text]).deliver

  end

  def contact

  end

end
