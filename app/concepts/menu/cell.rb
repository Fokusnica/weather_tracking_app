class Menu::Cell < Cell::Concept
  class MainPanel < Cell::Concept
    inherit_views Menu::Cell

    builds -> (model, params) do
      logged_in = params[:logged_in]
      current_user = params[:current_user]
      return self::SignedIn if logged_in
      self::NotSignedIn
    end

    def show
      render(:header_left_part)
    end

    private

    class NotSignedIn < MainPanel
      def setup!(model, options)
        @elements = [{
                         name: 'Sign Up',
                         path: sessions_sign_up_path,
                         # class: "#{active_class('sign_up_form')} item"
                     },
                     {
                         name: 'Sign In',
                         path: sessions_sign_in_path,
                         # class: "#{active_class('sign_in_form')} item"
                     }]
      end
    end

    class SignedIn < MainPanel
      def setup!(model, options)
        current_user = options[:current_user]
        @elements = [
            # {
            #     name: 'Dashboard',
            #     path: dashboard_path,
            #     class: "#{active_class('monitors')} item"
            # },
            # {
            #     name: 'Profile',
            #     path: users_edit_path(id: current_user.id),
            #     class: "#{active_class('users')} item"
            # },
            {
                name: "Log Out (#{current_user.email})",
                path: sessions_sign_out_path,
                class: 'item'
            }
        ]
      end
    end
  end
end