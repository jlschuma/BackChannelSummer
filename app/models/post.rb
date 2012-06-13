class Post < ActiveRecord::Base
  attr_accessible :body
  belongs_to :user
  has_many :comments

  def self.search(search)
   if search
       find(:all, :conditions => ['body LIKE ? or user.email LIKE ?', "%#{search}%", "%#{search}%"])
  else
    find(:all)

    end
  end


  def <=>(other)
    other.comments.length <=> self.comments.length    #reversed order because we want highest count first
  end
end
