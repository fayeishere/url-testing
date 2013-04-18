$(document).ready(function() {

  // var color_change = function(){
  //   if ( $('.output').html() == "OK" )
  //     $('.output').css('background', '#3A9129');
  //   else
  //     $('.output').css('background', 'red');
  // };
  // console.log (color_change);
  // color_change();

  function MakeStatusList(stat) {
    var post_status;
    console.log(stat);
    for (var i = 0; i < stat.length; i++) {
      post_status = $('<li>' + stat[i].url + " " + stat[i].code + '</li>');
      $('.output' + i).append(post_status);
      if (stat[i].code == "400" || stat[i].code == "500" || stat[i].code == "999") {
        $('.output' + i).css('background', 'red');
        console.log("not200");
      }
      else {
        $('.output' + i).css('background', '#3A9129');
        console.log("200");
      }
    }
  }

  // AJAX
    $.ajax ({
    url: "/url_status",
    dataType: "json",
    type: "GET",
    context: this,
    success: function(status) {
      // generate subject list via jquery
            console.log(status);
      MakeStatusList(status);


    }
  });
});