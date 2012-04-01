class BlogPost < Sequel::Model
  plugin :validation_helpers

  unless DATABASE.table_exists?(:blog_posts)
    DATABASE.create_table :blog_posts do
      primary_key :id
      varchar     :title
      text        :body
      varchar     :path_id
      timestamp   :created_at
      timestamp   :updated_at
      boolean     :private
    end
  end

  def before_validation
    self.assign_path_id unless self.path_id and not self.path_id.empty?
    super
  end

  def validate
    super
    validates_unique    [:path_id, :title]
    validates_presence  [:title, :path_id]
    validates_format    /[a-z_\d]+/, :path_id
  end

  def before_save
    self.updated_at = Time.now
    super
  end

  def before_create
    self.created_at ||= Time.now
    super
  end

  def assign_path_id
    self.path_id = self.title.strip.downcase.gsub(/\ +/, " ").gsub(" ", "_").gsub(/[^a-z_\d]/, "")
  end

  def first_paragraph
    self.body.split("</p>").first + "</p>"
  end
end
