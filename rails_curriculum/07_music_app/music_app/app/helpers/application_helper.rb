module ApplicationHelper
  
  def ugly_lyrics(lyrics) 
    html = '<pre>'
    lyrics.lines.each do |line| 
      html += "&#9835;#{h(line)}"
    end
    
    html+= '</pre>' 
    html.html_safe
  end

end
