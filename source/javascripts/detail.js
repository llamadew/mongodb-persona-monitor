$(document).ready(function() {
	$(window).scrollTop(0);

	$(document).keyup(function(e) {
    if (e.keyCode == 27) {
			$("#closeBtn").click();
    }
	});

});
