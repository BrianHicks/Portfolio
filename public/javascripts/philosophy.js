// navigator.standalone

var locked = false;

var touches = {
  first : [],
  last : []
}

var dimensions = {
  iPad : {
    "width" : "1024px",
    "height" : "768px"
  },
  iPhone : {
    "width" : "320px",
    "height" : "480px"
  }
}

function setUpInteraction() {
  if (isiOs()) {
    // set size of container
    var container = $("#container");

    if (isTablet()) {
      container.css("width", dimensions.iPad.width);
      container.css("height", dimensions.iPad.height);
      $("#inner").addClass("ipad");
    } else {
      container.css("width", dimensions.iPhone.width);
      container.css("height", dimensions.iPhone.height);
      $("#inner").addClass("iphone");
    }
    
    // add global event listeners
    var bodyEl = $("body")[0];
    addEventListener("orientationchange", checkOrientation);
    checkOrientation();
    bodyEl.ontouchstart = function(e) {
      var touch = e.touches[0];
      touches.first = [touch.pageX, touch.pageY];
    }
    bodyEl.ontouchmove = function(e) {
      var touch = e.touches[0];
      touches.last = [touch.pageX, touch.pageY];
      e.preventDefault();
    };
    bodyEl.ontouchend = function() {
      var statusString = "";
      statusString += touches.last[0] + ", " + touches.last[1] + " ended <br />";
      statusString += "Angle: " + mathHelper.angle(touches.first, touches.last) + "&deg; <br />";
      statusString += "Distance: " + mathHelper.distance(touches.first, touches.last) + "px <br />"
      statusString += "Direction: " + mathHelper.direction(touches.first, touches.last);
      console.log(statusString);
    }
  } else {
    // add buttons
    // keyboard events
  }
}

function checkOrientation() {
  switch (window.orientation) {
    case 0:
    case 180:
      if (isTablet()) {
        $("#container").addClass("hidden");
        locked = true;
      } else {
        $("#container").removeClass("hidden");
        locked = false;
      }
      break;
    case 90:
    case -90:
      isTablet() ? $("#container").removeClass("hidden") : $("#container").addClass("hidden");
      break;
  }
}

var mathHelper = {
  angle : function(coord0, coord1) { // arrays w/ two elements ea.
    var adjacent = Math.abs(coord0[1] - coord1[1]);
    var opposite = Math.abs(coord0[0] - coord1[0]);
    return Math.atan(adjacent/opposite) * (180/Math.PI);
  },
  distance : function(coord0, coord1) { // arrays w/ two elements ea.
    var rise = Math.abs(coord0[1] - coord1[1]);
    var run = Math.abs(coord0[0] - coord1[0]);
    return Math.sqrt((rise * rise) + (run * run));
  },
  direction : function(coord0, coord1) {
    return coord0[0] > coord1[0] ? "left" : "right";
  }
}

function isiOs() {
  return navigator.platform.match(/(iPad|iPod|iPhone)/i) ? true : false;
}

function isTablet() {
  return navigator.platform.match(/iPad/i) ? true : false;
}

$(document).ready(function() {
  setUpInteraction();
});
