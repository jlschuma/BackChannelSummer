class Comment < ActiveRecord::Base
  attr_accessible :body, :email
  belongs_to :post
end
