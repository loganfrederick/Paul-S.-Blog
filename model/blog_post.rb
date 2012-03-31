class BlogPost < Sequel::Model
  plugin :validation_helpers

  unless DATABASE.table_exists?(:blog_posts)
    DATABASE.create_table :blog_posts do
      primary_key :id
      varchar     :title
      text        :body
      varchar     :path_id
    end
  end

  def before_validation
    self.assign_path_id unless self.path_id and not self.path_id.empty?
    super
  end

  def validate
    super
    validates_unique    [:path_id, :title]
    validates_presence  [:title, :body, :path_id]
    validates_format    /[a-z_\d]+/, :path_id
  end

  def assign_path_id
    self.path_id = self.title.strip.downcase.gsub(/\ +/, " ").gsub(" ", "_").gsub(/[^a-z_\d]/, "")
  end
end
