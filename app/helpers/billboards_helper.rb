module BillboardsHelper
  
    def dialog_sent? billboard_id
      
      if user_signed_in?
        dialog_old = Dialog.where(:user_id => current_user.id, :billboard_id => billboard_id).first
        if Dialog.exists? dialog_old
          return dialog_old
        end
      end
      
      return nil
      
    end

end
