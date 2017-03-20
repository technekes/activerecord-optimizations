Rails.logger = Logger.new($stdout)

10.times do |i|
  User.where(name: "Author #{i}").first_or_create
end

100.times do |i|

  blog = Blog.where(title: "Blog #{i}").first_or_create
  blog.user_id = (1..10).to_a.sample
  blog.save

  1000.times do |n|
    c = Comment.where(blog_id: blog.id).first_or_create
    c.user_id = (1..10).to_a.sample
    c.save
  end
end
