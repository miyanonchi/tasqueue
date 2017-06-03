module ApplicationHelper
  def title(subtitle)
    subtitle = subtitle.to_s

    if subtitle.blank?
      Settings.app_name
    else
      subtitle + "|" + Settings.app_name
    end
  end

  def make_taskqueue(queue)
    res = ""

    res.concat %Q|<div class="taskqueue">|
    res.concat %Q|<div class="taskqueue-name">#{queue.name}</div>|

    queue.tasks.each do |t|
      res.concat <<-EOS
  <div class="task">
    #{t.task}
  </div>
      EOS
    end

    res << %Q{</div>}

    res.to_s.html_safe
  end
end
