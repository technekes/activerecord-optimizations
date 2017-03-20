logger           = Logger.new($stdout)
logger.level     = Logger::INFO
logger.formatter = Logger::Formatter.new
Rails.logger = logger

[User, Comment, Blog].each(&:delete_all)

=begin
10.times do |i|
  User.where(name: "Author #{i}").first_or_create
end
=end

100.times do |i|
  Blog.create(
    title: "Blog #{i}",
    user_id: rand(1...10)
  )
end

blog_ids = Blog.all.pluck(:id)
10_000.times do |n|
  Comment.create(
    body: SecureRandom.hex,
    user_id: rand(1...10),
    blog_id: blog_ids.sample
  )
end
