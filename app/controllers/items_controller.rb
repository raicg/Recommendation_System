class ItemsController < RecommendationController
  
  def index
    #min is defined for User Experience, it will be better if the user search for the minimum items first to see the list of all items
    min = 5
    @verifyMin = min - current_user.ratings.where("ratings.like = ?", "true").limit(min).count
    if @verifyMin == 0 or params[:title] or params[:genre] or params[:company]

      @items = Item.order('id').paginate(page: params[:page], per_page: 12)
      if params[:title]
        @items = @items.where("title ILIKE ?", "%#{params[:title]}%")
      end 
      if params[:genre]
        @items = @items.where("genre ILIKE ?", "%#{params[:genre]}%")
      end 
      if params[:company]
        @items = @items.where("company ILIKE ?", "%#{params[:company]}%")
      end

      if @verifyMin == 0
        recommendations(6)
      end

    else 

      @items = nil
      @recommendations = nil

    end
  end

  def show
    @item = Item.find(params[:id])
    rating = Rating.where(user_id: current_user.id, item_id: params[:id])
    if rating.none? == false
      if rating[0].like == true
        @disableLikeButton = true
        @disableDislikeButton = false
      else
        @disableLikeButton = false
        @disableDislikeButton = true
      end 
    else
      @disableLikeButton = false
      @disableDislikeButton = false
    end 
    render :layout => false
  end

  def result
    recommendations(12)
    @newItems = Item.limit(10).order('id desc')
  end

end
