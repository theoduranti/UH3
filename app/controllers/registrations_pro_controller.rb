class RegistrationsProController < Devise::RegistrationsController

    private
  
    def sign_up_params
      params.require(:pro).permit(:firstname, :secondname, :email, :photo, :description, :passion1, :passion2, :passion3, :passion4, :ville, :departement, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:pro).permit(:firstname, :secondname, :email, :photo, :description, :passion1, :passion2, :passion3, :passion4, :ville, :departement, :password, :password_confirmation)
    end
 end