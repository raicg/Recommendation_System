class HomeController < ApplicationController

  def index
    rating = current_user.ratings.limit(1)
    if rating.any?
      redirect_to result_item_index_path
    end
  end

  def indexAnonymous
  end

  def about
  end

end
