LegislatorsPage = function(){
    return {
        shouldInit: function(){
            return $('body').hasClass('legislators');
        },

        init: function(){
          $('.fichas').mixItUp();
        }
    }
}();

$(document).ready(function(){
  if (LegislatorsPage.shouldInit()) LegislatorsPage.init();
});