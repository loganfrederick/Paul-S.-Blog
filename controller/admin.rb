class Admin < Ramaze::Controller
  map '/paulissexy'
  set_layout 'admin'
  trait :auth_table => SUPERUSERS

  before_all do
    login_required unless request.env["PATH_INFO"] == "/login"
  end

  helper :auth
  def index
    @posts = BlogPost.order(:created_at.desc)
  end

  def edit(id)
    @post = BlogPost[id]
    return unless @post
  end

  def new
  end

  def create
    return unless request.post?

    title, body = request[:title, :body]
    BlogPost.create(:title => title, :body => body)

    redirect("/paulissexy")
  end

  def update(id)
    return unless request.post?

    post_id, title, body = request[:post_id, :title, :body]
    @post = BlogPost[post_id]

    @post.title = title
    @post.body = body
    @post.save

    redirect("/paulissexy")
  end

  def destroy(id)
    @post = BlogPost[id]
    redirect("/paulissexy") unless @post

    @post.destroy

    redirect("/paulissexy")
  end
end
