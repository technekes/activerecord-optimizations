logger           = Logger.new($stdout)
logger.level     = Logger::INFO
logger.formatter = Logger::Formatter.new
Rails.logger = logger

[User, Comment, Blog].each(&:delete_all)

10.times do |i|
  User.where(name: "Author #{i}").first_or_create
end
user_ids = User.all.pluck(:id)

100.times do |i|
  Blog.create(
    title: "Blog #{i}",
    user_id: user_ids.sample
  )
end

blog_ids = Blog.all.pluck(:id)
10_000.times do |n|
  Comment.create(
    body: SecureRandom.hex,
    user_id: user_ids.sample,
    blog_id: blog_ids.sample
  )
end
