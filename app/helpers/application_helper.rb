module ApplicationHelper

  def pretty_date(date)
    date.strftime("%b %d %Y")
  end

  def pretty_url(url)
    url.include?("http://") ? url : "http://#{url}"
  end


end
