$(document).ready(function() {
	$(window).scrollTop(0);
	var img = new Image();
	var personaImage = $('.persona-image');
	var imageSrc = $(personaImage).attr('data-bg');
	img.src = imageSrc;

	function imgLoaded(imgElement) {
  	return imgElement.complete && imgElement.naturalHeight !== 0;
	}

	if( ! imgLoaded(img) ) {
		img.onload = function() {
			setTimeout(function() {
				personaImage.css('background-image', "url('" +  imageSrc + "')");
			}, 500)
		};
	} else {
		personaImage.css('background-image', "url('" +  imageSrc + "')");
	}

	$(document).keyup(function(e) {
    if (e.keyCode == 27) {
			$("#closeBtn").click();
    }
	});

});
