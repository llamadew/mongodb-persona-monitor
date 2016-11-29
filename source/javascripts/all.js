//= require jquery.min
//= require flickity.min
//= require smoothstate.min

$(document).ready(function() {
  var options = {
    debug: true,
    prefetch: false,
    onStart: {
      duration: 500, // Duration of our animation
      render: function ($container) {
        $container.addClass('is-exiting');
        smoothState.restartCSSAnimations();
      }
    },
    onReady: {
      duration: 0,
      render: function ($container, $newContent) {
        $container.removeClass('is-exiting');
        $container.html($newContent);
      }
    }
  };

  smoothState = $('#main').smoothState(options).data('smoothState');
});
