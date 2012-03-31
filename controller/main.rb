Ramaze::Route[/\/paulissexy([a-z0-9_\/]*)/] = "/paulissexy%s"
Ramaze::Route[/\/([a-z0-9_]+)/] = '/view_post/%s'

class MainController < Controller
  # the index action is called automatically when no other action is specified
  def index
    @title = "Sixofhearts = Paul S. Chun"
    @posts = BlogPost.limit(3)
  end

  def view_post(path_id)
    @post = BlogPost.first(:path_id => path_id)
    raise "Bad Path ID" unless @post

    @title = "Sixofhearts = Paul S. Chun &gt; " + @post.title
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    @title = 'Welcome to Ramaze!'
    
    return 'There is no \'notemplate.xhtml\' associated with this action.'
  end
end
