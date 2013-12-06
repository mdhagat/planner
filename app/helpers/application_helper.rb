module ApplicationHelper

    # Save path to return to and redirect to login page
    def signed_in_user
      unless signed_in?
#        store_location
        redirect_to new_session_path, notice: "But first, please sign in."
      end
    end

end
