// navigator.standalone

var locked = false;

var touches = {
  first : [],
  last : [],
  current : []
};

var dimensions = {
  iPad : {
    "width" : "1024px",
    "height" : "768px"
  },
  iPhone : {
    "width" : "320px",
    "height" : "480px"
  }
};

var panes = {
  total : 6,
  current : 1,
  width : 0,
  x : 0,
  slider : null,
  moveTo : function(x) {
    if (!mathHelper.isNaN(x)) {
      var currentx = parseInt(this.slider.style.left, 10);
      this.slider.style.left = (currentx + x) + "px";
    }
  }
};

function setUpInteraction() {
  // cache elements
  container = document.getElementById("container");
  panes.slider = $("#inner")[0];
  var bodyEl = $("body")[0];

  if (isiOs()) {
    // set size of container
    if (isTablet()) {
      container.style.width = dimensions.iPad.width;
      container.style.height = dimensions.iPad.height;
      panes.width = dimensions.iPad.width;
      $("#inner").addClass("ipad");
    } else {
      container.style.width = dimensions.iPhone.width;
      container.style.height = dimensions.iPhone.height;
      panes.width = dimensions.iPhone.width;
      $("#inner").addClass("iphone");
    }

    // add global event listeners
    addEventListener("orientationchange", checkOrientation);
    checkOrientation();
    bodyEl.ontouchstart = function(e) {
      var touch = e.touches[0];
      touches.first = [touch.pageX, touch.pageY];
    };
    bodyEl.ontouchmove = function(e) {
      var touch = e.touches[0];
      touches.last = touches.current;
      touches.current = [touch.pageX, touch.pageY];
      panes.moveTo(mathHelper.distance(touches.last, touches.current));
      e.preventDefault();
    };
    bodyEl.ontouchend = function() {
      panes.moveTo(80);
      touches.last, touches.current = [];
    };
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
  distance : function(coord0, coord1) { // arrays w/ two elements ea.
    var rise = Math.abs(coord0[1] - coord1[1]);
    var run = Math.abs(coord0[0] - coord1[0]);
    return Math.sqrt((rise * rise) + (run * run));
  },
  isNaN : function(num) {
    if (num === 0) {
      return false;
    } else {
      return !(0 > num || 0 < num);
    }
  }
};

function isiOs() {
  return navigator.platform.match(/(iPad|iPod|iPhone)/i) ? true : false;
}

function isTablet() {
  return navigator.platform.match(/iPad/i) ? true : false;
}

$(document).ready(function() {
  setUpInteraction();
});
