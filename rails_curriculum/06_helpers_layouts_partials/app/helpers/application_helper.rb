module ApplicationHelper

  def auth_token 
    html = '<input type="hidden"'
    html += 'name="authenticity_token"'
    html += "value=#{h(form_authenticity_token)}"
    html += '/>'

    html.html_safe
  end
end
