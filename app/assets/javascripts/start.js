(function() {
  var dropSchool = function() {
    var paper = $('.paper');
    paper.addClass('slideDown');
    paper.css('visibility', 'visible');
  };

  if ($('body.landing.start').length) {

      setTimeout(dropSchool, 1500);
  }
})();
