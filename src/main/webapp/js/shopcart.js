$(document).ready(function () {

    function total(){
        var checked = $("input[name='checkedId']:checked");
        var total = 0;
        for (var i = 0;i<checked.length;i++){
            var _totalprice = checked[i].getAttribute("totalprice");
            var totalpeice = parseInt(_totalprice)
            total +=totalpeice;
        }
        $("#total").text(total);
    }
    $(".checkedId").click(function () {
        total()
    });


    $("#checkAll").click(function () {
        var flag = $("#checkAll").prop("checked");
        $(".checkedId").each(function () {
            $(this).prop("checked",flag);
        });
        total()
    });
});


$(function () {
    $(".barfunction").find("li").each(function () {
        var a = $(this).find("a:first")[0];
        if ($(a).attr("href") === location.pathname) {
            $(this).addClass("active");
        } else {
            $(this).removeClass("active");
        }
    });
})


$(function () {
    $(".barshopcart").find("li").each(function () {
        var a = $(this).find("a:first")[0];
        if ($(a).attr("href") === location.pathname) {
            $(this).addClass("active");
        } else {
            $(this).removeClass("active");
        }
    });
})