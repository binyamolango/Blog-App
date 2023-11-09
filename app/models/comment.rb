class Comment < ActiveRecord
  belongs_to :user, :post
end
