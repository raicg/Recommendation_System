class RatingController < ApplicationController
  
  def create
    @rating = Rating.where(user_id: current_user.id, item_id: params[:item_id])

    #if doesnt exists any rating from this user for that item, create a new one
    if @rating.none? == true
      @rating = Rating.new()
      @rating.user_id = current_user.id
       @rating.item_id = params[:item_id]
      @rating.like = params[:like]
      @rating.save()
    else
    #if exists a rating from this user for that item, just change the like
      @rating[0].like = params[:like]
      @rating[0].save()
    end
    @like = params[:like] #to be used on create.js.erb
    respond_to do |format|
      format.js
    end
  end

  def destroyAll
    if current_user.ratings.empty?
      redirect_to item_index_path
    else
      if params[:delete] == "true"
        @rating = Rating.where(user_id: current_user.id)
        @rating.destroy_all
        redirect_to item_index_path
      elsif params[:delete] == "false"
        redirect_to item_index_path
      end
    end
  end
 
end
