class RecommendationController < ApplicationController

  def recommendations(howMany)
    @recommendations = []
    @itemsLike = []
    @itemsDontLike = []
    similarUsers = []
    counts = Hash.new(0)

    current_user.ratings.each do |r|
      if r.like == true
        @itemsLike.append(r.item)
      else
        @itemsDontLike.append(r.item)
      end
    end

    @itemsLike.each do |s|
      s.ratings.each do |r|
        if r.like == true
          similarUsers.append(r.user)
        end
      end
    end

    similarUsers.each { |similarUsers| counts[similarUsers] += 1 }
    counts = counts.sort()
    counts.delete(current_user)

    while (@recommendations.length < howMany and counts.empty? == false)
      counts.first()[0].ratings.each do |r|
        if @recommendations.length == howMany
          break
        end

        item = r.item
        if @itemsLike.empty? == false
          next if @itemsLike.include? item
        end
        if @itemsDontLike.empty? == false
          next if @itemsDontLike.include? item
        end

        if @recommendations.empty? == false
          next if @recommendations.include? item
        end

        @recommendations.append(item)
        
      end
      counts.shift()
    end
  end

end
