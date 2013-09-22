module ApplicationHelper

  def pretty_date(date)
    date.strftime("%b %d %Y")
  end

  def pretty_url(url)
    url.include?("http://") ? url : "http://#{url}"
  end

  def noquery_vote(votes)
    votes.select{|vote| vote.vote == true}.size - votes.select{|vote| vote.vote == false}.size
  end

end
