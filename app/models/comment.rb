class Comment < ActiveRecord::Base
  validates :body, :link, presence: true
  belongs_to :link
end
