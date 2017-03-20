logger           = Logger.new($stdout)
logger.level     = Logger::INFO
logger.formatter = Logger::Formatter.new
Rails.logger = logger

10.times do |i|
  User.where(name: "Author #{i}").first_or_create
end

100.times do |i|

  blog = Blog.where(title: "Blog #{i}").first_or_create do |blog|
    blog.user_id = (1..10).to_a.sample
  end

  1000.times do |n|
    Comment.where(blog_id: blog.id).first_or_create do |c|
      c.user_id = (1..10).to_a.sample
    end
  end
end
