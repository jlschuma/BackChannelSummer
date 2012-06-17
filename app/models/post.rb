# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  body       :text
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Post < ActiveRecord::Base
  attr_accessible :body, :email
  belongs_to :user
  has_many :comments

  validates :email, presence: true

  def self.search(search)
   if search
     begin
       #Lookup on posts and comments, could have also used reg expressions in a loop
       @results = Post.connection.execute("select distinct p.id from posts p left join comments c on p.id = c.post_id where p.email like '%"+search+"%' or p.body like '%"+search+"%' or c.email like '%"+search+"%' or c.body like '%"+search+"%'")
       @ids = []
       @results.each do |i|
         @ids << i["id"]
       end
       find(:all, :conditions => ['id in (?)', @ids])
     end
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
