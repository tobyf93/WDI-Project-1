module ApplicationHelper
  def navigation
    html = ''

    html << user_nav
    html << logged_out_nav

    "<ul class='nav navbar-nav pull-right'>#{html}</ul>"
  end

  private
  def user_nav
    html = ''

    if @current_user.present?
      html << "<p class='navbar-text'>Welcome #{@current_user.username}!</p>"
      html << "<li><a href='#{users_path}'>View Users</a></li>"
      html << "<li><a href='#{new_user_item_path @current_user}'>Create Item</a></li>"
      html << "<li><a href='#{user_items_path @current_user}'>All Items</a></li>"
      html << "<li><a href='#{user_location_path @current_user}'>Edit Location</a></li>"
      html << "<li>#{button_to 'Logout', logout_path, :form_class => 'navbar-form', :class => 'btn btn-default', :method => :delete}</li>"
    end

    html
  end

  def admin_nav
  end

  def logged_out_nav
    html = ''

    if !@current_user
      html << "<li><a href='#{signup_path}'>Sign Up</a></li>"
      html << "<li><a href='#{login_path}'>Login</a></li>"
    end

    html
  end
end
