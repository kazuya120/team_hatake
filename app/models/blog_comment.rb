class BlogComment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :comment, presence: true
  validates :blog_id, presence: true
  validates :user_id, presence: true
end
