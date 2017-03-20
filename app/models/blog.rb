class Blog < ActiveRecord::Base
  has_many :comments, counter_cache: :comments_count
  has_one :last_comment,
    -> { order(updated_at: :desc).limit(1) },
    class_name: 'Comment'
end
