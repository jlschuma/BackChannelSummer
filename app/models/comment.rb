# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  body       :text
#  post_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Comment < ActiveRecord::Base
  attr_accessible :body, :email
  belongs_to :post

  def comment_text
    return body if !body.nil? && body.length > 0
    return '+1'
  end
  
  def author_name
    return email if User.all.select {|user| user.email == email}.length > 0
    return "<deleted user>"
  end  
  
end
