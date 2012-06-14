class Post < ActiveRecord::Base
  attr_accessible :body
  belongs_to :user
  has_many :comments

  def self.search(search)
   if search
       # TODO: I broke this when removing email from search model. 
       # We need to add email back to model or do a join here (or both).
       #find(:all, :conditions => ['body LIKE ? or user.email LIKE ?', "%#{search}%", "%#{search}%"])
       find(:all, :conditions => ['body LIKE ?', "%#{search}%"])
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
