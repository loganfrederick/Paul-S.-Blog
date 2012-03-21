$(document).ready(function() {
    $("#links a").hover(function() {
	$(this).animate({"background-color": "#900"}, 200);
    }, function() {
	$(this).animate({"background-color": "#600"}, 100);
    });
});
