module ApplicationHelper
  def hidden_fields (form, *fields)
    html = ""
    fields.each do |field|
      html += form.hidden_field(field)
    end
    html.html_safe
  end

  def flash_class(level)
    case level
      when :notice  then "alert alert-info"
      when :success then "alert alert-success"
      when :error   then "alert alert-danger"
      when :alert   then "alert alert-warning"
    end
  end
end
