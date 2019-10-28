class Post < ApplicationRecord
  #the post is destroyed the  comments that are dependent on it are also destroyed
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
end
