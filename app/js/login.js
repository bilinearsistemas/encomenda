"use strict";
$(document).ready(function () {
    $('input').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue',
        increaseArea: '20%' // optional
    });
    
    $("#pwd").focus(function() {
        $("#msgbox").removeClass().text('').fadeIn(300);
    });
    $("#usr").focus();
	
    //=================Preloader===========//
    //$(window).on('load', function () {
        $('.preloader img').fadeOut();
        $('.preloader').fadeOut();
    //});
    //=================end of Preloader===========//
});
