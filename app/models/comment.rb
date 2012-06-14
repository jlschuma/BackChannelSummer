class Comment < ActiveRecord::Base
  attr_accessible :body, :email
  belongs_to :post

  def comment_text
    return body if !body.nil? && body.length > 0
    return '+1'
  end
  
end
