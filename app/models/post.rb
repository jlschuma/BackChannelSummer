class Post < ActiveRecord::Base
  attr_accessible :body, :email
  belongs_to :user
  has_many :comments

  def self.search(search)
   if search
       #TODO Add Comments
       find(:all, :conditions => ['body LIKE ? or email LIKE ?', "%#{search}%", "%#{search}%"])
  else
    find(:all)

    end
  end

  def post_text
    return body if !body.nil? && body.length > 0
    return 'Not much to say...'
  end
  
  def post_created
    created_at.strftime "%B %d, %Y %l:%M %p"
  end
  
  def <=>(other)
    other.comments.length <=> self.comments.length    #reversed order because we want highest count first
  end
end
