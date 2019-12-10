class ApplicationController < ActionController::Base

    # Create user filter to restrict certain actions only to admin users
    def authorize_admin
        if not current_user or not Role.find(current_user.role_id).name == "ADMIN"
            redirect_to root_path, alert: 'Access Denied'
        end
    end

end
