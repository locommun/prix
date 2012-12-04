module BillboardsHelper
  
    def dialog_sent?
      
      if user_signed_in?
        dialog_old = Dialog.where(:user_id => current_user.id).first
        if Dialog.exists? dialog_old
          return true
        end
      end
      
      return false
      
    end
    
    def get_dialog_partner dialog_id
        dialog = Dialog.find(dialog_id)
        if dialog
          if !dialog.parent
            dialog_partner = Dialog.where(:parent => dialog_id).first
            return User.find(dialog_partner.user_id).name
          else
            return User.find(dialog.parent).name
          end
        end
    end
    
    def dialog_closed? dialog_id
        
      dialog = Dialog.where(:parent => dialog_id).first
      if Dialog.exists? dialog
        return true
      end
      
      return false
    
    end
end
