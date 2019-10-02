/* global $ */

$(document).on('turbolinks:load', function (){
  var
  elements = document.querySelectorAll(".well"),
  heights = [];

  /* Getting an array with the heights */
  [].forEach.call(elements, function(each) {
    heights[heights.length] = getComputedStyle(each, null).getPropertyValue("height");
  });
  
  /* Sorting the array to get the greatest value first */
  heights.sort(function(a, b) {
    return parseFloat(b) - parseFloat(a);
  });
  
  /* Applying the greatest height to each element */
  [].forEach.call(elements, function(each) {
    each.style.height = heights[0];
  });
});