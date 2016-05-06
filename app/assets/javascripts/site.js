$(document).on('ready page:load', function(){
    $('.rating').raty( { path: '/assets/images/star-on.png', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets/images/star-on.png',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
});
