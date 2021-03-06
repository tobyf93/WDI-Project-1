module ApplicationHelper
  def navigation
    html = ''

    html << '<ul class="nav navbar-nav pull-right">'
    html << user_nav
    html << admin_nav
    html << logged_out_nav
    html << "</ul>"

    html
  end

  private
  def user_nav
    html = ''

    if @current_user.present?
      html << "<p class='navbar-text'>#{@current_user.username}</p>"
      html << "<li class='navbar-brand'><img id='avatar' src='#{asset_path 'avatar.png'}'></li>"
      html << "<li><a href='#{discover_path}'>Discover</a></li>"
      # html << "<li><a href='#{new_item_path}'>Create Item</a></li>"
      html << "<li><a href='#{items_path}'>My Uploads</a></li>"
    end

    html
  end

  def admin_nav
    html = ''

    if @current_user.present? && @current_user.admin?
      html << '<li class="dropdown">'
      html << '<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Admin<span class="caret"></span></a>'
      html << '<ul class="dropdown-menu" role="menu">'

      html << "<li><a href='#{users_path}'>View Users</a></li>"
      html << "<li><a href='#{location_path}'>Edit Location</a></li>"

      html << '</ul></li>'
    end

    # This needs to be moved
    if @current_user.present?
      html << "<li>#{button_to 'Logout', logout_path, :form_class => 'navbar-form', :class => 'btn btn-default', :method => :delete}</li>"
    end

    html
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
