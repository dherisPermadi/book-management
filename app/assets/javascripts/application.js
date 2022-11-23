// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


//= require jquery3
//= require jquery_ujs 
//= require bootstrap-datepicker

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

/**
 *
 */
 let hexToRgba = function(hex, opacity) {
  let result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  let rgb = result ? {
    r: parseInt(result[1], 16),
    g: parseInt(result[2], 16),
    b: parseInt(result[3], 16)
  } : null;

  return 'rgba(' + rgb.r + ', ' + rgb.g + ', ' + rgb.b + ', ' + opacity + ')';
};

/**
 *
 */
$(document).ready(function() {
  /** Constant div card */
  const DIV_CARD = 'div.card';

  /** Initialize tooltips */
  $('[data-toggle="tooltip"]').tooltip();

  /** Initialize popovers */
  $('[data-toggle="popover"]').popover({
    html: true
  });

  /** Function for remove card */
  $('[data-toggle="card-remove"]').on('click', function(e) {
    let $card = $(this).closest(DIV_CARD);

    $card.remove();

    e.preventDefault();
    return false;
  });

  /** Function for collapse card */
  $('[data-toggle="card-collapse"]').on('click', function(e) {
    let $card = $(this).closest(DIV_CARD);

    $card.toggleClass('card-collapsed');

    e.preventDefault();
    return false;
  });

  /** Function for fullscreen card */
  $('[data-toggle="card-fullscreen"]').on('click', function(e) {
    let $card = $(this).closest(DIV_CARD);

    $card.toggleClass('card-fullscreen').removeClass('card-collapsed');

    e.preventDefault();
    return false;
  });

  /**  */
  if ($('[data-sparkline]').length) {
    let generateSparkline = function($elem, data, params) {
      $elem.sparkline(data, {
        type: $elem.attr('data-sparkline-type'),
        height: '100%',
        barColor: params.color,
        lineColor: params.color,
        fillColor: 'transparent',
        spotColor: params.color,
        spotRadius: 0,
        lineWidth: 2,
        highlightColor: hexToRgba(params.color, .6),
        highlightLineColor: '#666',
        defaultPixelsPerValue: 5
      });
    };

    require(['sparkline'], function() {
      $('[data-sparkline]').each(function() {
        let $chart = $(this);

        generateSparkline($chart, JSON.parse($chart.attr('data-sparkline')), {
          color: $chart.attr('data-sparkline-color')
        });
      });
    });
  }

  /**  */
  if ($('.chart-circle').length) {
    require(['circle-progress'], function() {
      $('.chart-circle').each(function() {
        let $this = $(this);

        $this.circleProgress({
          fill: {
            color: tabler.colors[$this.attr('data-color')] || tabler.colors.blue
          },
          size: $this.height(),
          startAngle: -Math.PI / 4 * 2,
          emptyFill: '#F4F4F4',
          lineCap: 'round'
        });
      });
    });
  }
});