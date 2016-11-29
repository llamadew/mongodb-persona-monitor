$(document).ready(function() {
  var slider = $('.persona-tiles').flickity({
    cellAlign: 'center',
    groupCells: '80%',
    wrapAround: true,
    watchCSS: true,
    prevNextButtons: false
  });

  slider.on( 'dragStart.flickity', function( ) {
    $(this).addClass('is-dragging');
  });

  slider.on( 'dragEnd.flickity', function( ) {
    $(this).removeClass('is-dragging');
  });
})
