class ApplicationController < ActionController::Base

    # Create user filter to restrict certain actions only to admin users
    def authorize_admin
        if not current_user or not current_user.role.name == ROLE_ADMIN
            redirect_to root_path, alert: 'Access Denied'
        end
    end

end
