module ApplicationHelper

  def pretty_date(date)
    date = date.in_time_zone(user_zone) if logged_in?
    date.strftime("%b %d %Y %H:%M %Z")
  end

  def pretty_url(url)
    url.include?("http://") ? url : "http://#{url}"
  end

  def noquery_vote(votes)
    votes.select{|vote| vote.vote == true}.size - votes.select{|vote| vote.vote == false}.size
  end

end
