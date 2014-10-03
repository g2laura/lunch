module ApplicationHelper
  def hidden_fields (form, *fields)
    html = ""
    fields.each do |field|
      html += form.hidden_field(field)
    end
    html.html_safe
  end
end
