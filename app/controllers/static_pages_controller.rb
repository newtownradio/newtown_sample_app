class StaticPagesController < ApplicationController
  layout "static"
  def landing_page
    @products = Product.limit(3)
  end
  def index
  end
  def about
  end
  def contact 
  end
  def featured
  end
  def calendar
  end
end
