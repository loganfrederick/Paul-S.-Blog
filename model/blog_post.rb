class BlogPost < Sequel::Model
  unless DATABASE.table_exists?(:blog_posts)
    DATABASE.create_table :blog_posts do
      primary_key :id
      varchar     :title
      text        :body
      varchar     :path_id
    end
  end

  def validate
    super
    validates_unique    :path_id
    validates_presence  :title, :body, :path_id
    validates_format    /[a-z_]+/, :path_id
  end

  def before_validation
    self.path_id = self.title.strip.downcase.gsub(/\ +/, " ").gsub(/[^a-z_]/, "")
    super
  end
end
