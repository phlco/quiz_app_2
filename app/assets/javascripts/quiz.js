Array.prototype.sort = function() {

    function compare(a, b) {
        if (a < b) {
            return -1;
        } else if (a > b) {
            return 1;
        } else {
            return 0;
        }
    }

    for (var i = 0; i < this.length; i++) {
        var compareValue = compare(this[i], this[i+1]);
        if (compareValue === -1) {
            console.log(this[i] + " is less than " + this[i+1]);
        } else if (compareValue === 1) {
            var switch1 = this[i];
            var switch2 = this[i+1];
            this[i] = switch2;
            this[i+1] = switch1;
            this.sort();
            break;
        }
    }

    return this;
};

var sortQuiz = {
  sort: function() {
    var array = ($("input").val()).split(", ");
    console.log("you typed: " + array);

    $("input").attr("disabled", "disabled");
    $("button").attr("disabled", "disabled");

    var newArray = array.sort();
    console.log("sorted??? " + newArray);
    var display = newArray.join(", ");
    $("h4").html(display);
  }
};

$(document).ready(function() {
  $("#quiz").on("click", "button", sortQuiz.sort);
});