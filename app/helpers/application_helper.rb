module ApplicationHelper
  def full_title(page_title)
    base_title = "CrowdPublish.TV"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def resource_name
    :user
  end

#I don't know why this screws up signup
#  def resource
#    @resource ||= User.new
#  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

#sets Bootstrap class for alerts 
  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"   # Green
    when "error"
      "alert-danger"    # Red
    when "alert"
      "alert-warning"   # Yellow
    when "notice"
      "alert-info"      # Blue
    else
      flash_type.to_s
    end
  end

end