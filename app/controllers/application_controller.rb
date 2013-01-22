class ApplicationController < ActionController::Base
  protect_from_forgery
   before_filter :track_user
   
   def track_user 
      ip = request.remote_ip 
      useragent = request.env['HTTP_USER_AGENT']
      user_tracking = UserTracking.new(:visitor => ip + "#" +  useragent, :url => request.path)
      user_tracking.save
   end
   
   def after_sign_in_path_for(resource_or_scope)
     if session.has_key?(:billboard) 
       billboard = Billboard.find session[:billboard]
       flash[:notice] = current_user.activate_billboard billboard
       return billboard_path(billboard)
     end
      if get_stored_location
        store_location = get_stored_location
        clear_stored_location
        (store_location.nil?) ?  billboards_path : store_location.to_s
      else
         announcements_path
      end
  end
  
  # Useful Set of Methods for Storing Objects for session initiation
  def deny_access_to_save_object serialized_object, path = request.path
    flash[:warning] = "Du musst dich zuerst einloggen bevor du weitermachen kannst!"
    session[:return_to] = path
    session[:stored_object] = serialized_object
    redirect_to new_user_session_path
  end

  def clear_stored_location
    session[:return_to] = nil
  end

  def clear_stored_object
    session[:stored_object] = nil
  end

  def get_stored_object
    session[:stored_object]
  end

  def get_stored_location
    session[:return_to]
  end
  
  def show_announcement announcement
     @json = announcement.to_gmaps4rails
  end
  
  def show_billboard billboard
     @json = billboard.to_gmaps4rails
  end
  
end
