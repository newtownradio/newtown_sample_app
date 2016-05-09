class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
  validates :name, presence: true

def average_rating
 comments.average(:rating).to_f
end

end

## perform a paginated query:
@posts = Post.paginate(:page => params[:page])

# or, use an explicit "per page" limit:
Post.paginate(:page => params[:page], :per_page => 30)

## render page links in the view:
<%= will_paginate @posts %>



