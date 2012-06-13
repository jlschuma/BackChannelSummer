class Post < ActiveRecord::Base
  attr_accessible :body, :email
  has_many :comments
  belongs_to :user

  def self.search(search)
   if search
       find(:all, :conditions => ['body LIKE ? or email LIKE ?', "%#{search}%", "%#{search}%"])
  else
    find(:all)

    end
  end


  def <=>(other)
    other.comments.length <=> self.comments.length    #reversed order because we want highest count first
  end
end
