var incrementViewCount = (function($) {
    var updateViewCount = function(views) {
        $(".laugh-views").text(views + " views");
    }

    return function(laugh_id) {
        $.ajax("/laughs/"+laugh_id+"/increment_views", {
            type: "POST",
            dataType: "json",
            success: function(data) {
                updateViewCount(data.views);
            }
        });
    };
})(jQuery);
