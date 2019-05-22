//divs: newItems, itemsDontLike, itemsLike, recommendations

function scrollDiv(div, x) {
  if (div == "newItems") {    
    newItems = $("div.newItems").scrollLeft();
    $("div.newItems").scrollLeft(newItems + x);
  }
  else if (div == "itemsDontLike") {
    itemsDontLike = $("div.itemsDontLike").scrollLeft();
    $("div.itemsDontLike").scrollLeft(itemsDontLike + x);
  }
  else if (div == "itemsLike") {
    itemsLike = $("div.itemsLike").scrollLeft();
    $("div.itemsLike").scrollLeft(itemsLike + x);
  }
  else if (div == "recommendations") {
    recommendations = $("div.itemsRecommendation").scrollLeft();
    $("div.itemsRecommendation").scrollLeft(recommendations + x);
  }
}
