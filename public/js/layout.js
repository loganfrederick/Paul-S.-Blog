$(document).ready(function() {
    $("#links li.first-level").hover(function() {
	$(this).children("a:first").animate({"background-color": "#CA7"}, 200);
	if($(this).children(".second-level").length > 0) {
	    $(this).children(".second-level").fadeIn(200);
	}
    }, function() {
	$(this).children("a:first").animate({"background-color": "#B1946C"}, 100);
	if($(this).children(".second-level").length > 0) {
	    $(this).children(".second-level").fadeOut(200);
	}
    });
    $("#links .second-level li").hover(function() {
	$(this).children("a:first").animate({"background-color": "#CA7"}, 200);
    }, function() {

    });
});
