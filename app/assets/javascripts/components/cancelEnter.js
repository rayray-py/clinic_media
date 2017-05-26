$('.cancelEnter').bind('keydown', function(e) {
    if (e.which == 13) {
        return false;
    }
}).bind('blur', function() {
    var $textarea = $(this),
        text = $textarea.val(),
        new_text = text.replace(/\n/g, "");
    if (new_text != text) {
        $textarea.val(new_text);
    }
});
