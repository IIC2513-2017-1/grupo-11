/**
 * Created by Niv on 09-06-2017.
 */
$(document).on('turbolinks:load', function () {

    alert("1");

    // OffCanvass
    var offCanvass = function() {
        $('body').on('click', '.menu-btn', function(e){
            $('#offcanvass').addClass('awake');
            e.preventDefault();
        });
    };

    // Click outside of offcanvass
    var mobileMenuOutsideClick = function() {
        $(document).click(function (e) {
            var container = $("#offcanvass, .js-menu-btn");
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                if ( $('#offcanvass').hasClass('awake') ) {
                    $('#offcanvass').removeClass('awake');
                }
            }
        });

        $(window).scroll(function(){
            if ( $(window).scrollTop() > 500 ) {
                if ( $('#offcanvass').hasClass('awake') ) {
                    $('#offcanvass').removeClass('awake');
                }
            }
        });
    };


    $(function(){
        offCanvass();
        mobileMenuOutsideClick();
    });


}());
