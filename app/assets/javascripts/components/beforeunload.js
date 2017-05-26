$(function(){
    $(window).on('beforeunload',function(){
        return "";
    });

    $('form').on('submit',function(){
        $(window).off('beforeunload');
    });
});
