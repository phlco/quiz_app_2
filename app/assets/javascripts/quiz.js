$(document).ready(function(){
  $('#sort').click(function(){
    nums = $('#numbers').val();
    var newArray = makeArray(nums);
    $('#numbers').remove();
    $('#sort').remove();
    $('#quiz').append(newArray.join(", "));
  })
});

var makeArray = function(nums) {
    var no_space = nums.replace(/ /g, "");
    var array = no_space.split(",");
    for (i = 0; i < array.length; i++) {
      array[i] = parseInt(array[i]);
    }
    array = array.sort(function(a, b) {
      return a - b;
    });
    console.log(array);
    return array;
}