Ramaze::Route[/\/paulissexy([a-z0-9_\/]*)/] = "/paulissexy%s"
Ramaze::Route["/all_posts"] = "/all_posts"
Ramaze::Route[/\/([a-z0-9_]+)/] = '/view_post/%s'

class MainController < Controller
  # the index action is called automatically when no other action is specified
  def index
    @title = "Sixofhearts = Paul S. Chun"
    @posts = BlogPost.order(:created_at.desc).limit(3)
  end

  def view_post(path_id)
    @post = BlogPost.first(:path_id => path_id)
    raise "Bad Path ID" unless @post

    @title = "Sixofhearts = Paul S. Chun &gt; " + @post.title
    @fb_desc = @post.first_paragraph.gsub(/<[^>]*>/, "").gsub('"', "'")
  end

  def all_posts
    @title = "Sixofhearts = Paul S. Chun &gt; All Posts"
    @recent_posts = BlogPost.order(:created_at.desc)
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    @title = 'Welcome to Ramaze!'
    
    return 'There is no \'notemplate.xhtml\' associated with this action.'
  end

  private
  def time_ago(time)
    distance = ((Time.now - time) / 60).to_i
    case distance
    when 0..1 then "just now"
    when 1..60 then "#{distance} minutes ago"
    when 60..60*24 then "#{distance/60} hours ago"
    when 60*24..60*24*30 then "#{distance/60/24} days ago"
    when 60*24*30..60*24*365 then "#{distance/60/24/30} months ago"
    when 60*24*365..60*24*365*2 then "1 year and #{(distance/60/24/30) - 12} months ago"
    else "#{distance/60/24} years ago"
    end
  end
end
