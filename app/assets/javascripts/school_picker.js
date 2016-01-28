(function() {

  var sendToArena = function(target, data) {
    var url = target.attr('href');
    url += '?user_id=' + data.userId;
    url += '&my_school_id=' + data.mySchoolId;
    url += '&opp_school_id=' + data.oppSchoolId;

    window.location.href = url;
  };

  var highlightMySchool = function(id) {
    var mySchoolPane = $('.school[data-my-school-id="' + id + '"]')
    mySchoolPane.css('background', 'yellow');
  };

  var pickOpponentSchool = function(id) {
    var oppSchool = $('.school[data-my-school-id="' + id + '"]');
    oppSchool.css('background', 'green');
    // $('.school').each(function(idx, el) {
      // $(el).css('background', 'green');
    // })
  };


  if ($('body.versus.school_picker').length) {

    $('.school').click(function(el) {
      el.preventDefault();

      var target = $(el.currentTarget);
      var data = target.data();

      // highlightMySchool(data.mySchoolId);
      // pickOpponentSchool(data.oppSchoolId);
      setTimeout(sendToArena(target, data), 5000);
    });
  }
})();
