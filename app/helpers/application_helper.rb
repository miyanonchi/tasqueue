module ApplicationHelper
  def title(subtitle)
    subtitle = subtitle.to_s

    if subtitle.blank?
      Settings.app_name
    else
      subtitle + "|" + Settings.app_name
    end
  end
end
