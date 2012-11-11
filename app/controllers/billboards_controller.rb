class BillboardsController < ApplicationController
  def index
    @billboards = Billboard.all
    @json = Billboard.all.to_gmaps4rails
    
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @billboards }
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
