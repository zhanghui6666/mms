$(document).ready(function () {

    /*计算总价*/
    function total() {
        var checked = $("input[name='checkedId']:checked");
        var total = 0;
        for (var i = 0; i < checked.length; i++) {
            var _totalprice = checked[i].getAttribute("totalprice");
            var totalpeice = parseInt(_totalprice)
            total += totalpeice;
        }
        $("#total").text(total);
    }

    $(".checkedId").click(function () {
        total();
    });


    /*全选计算总价*/
    $("#checkAll").click(function () {
        var flag = $("#checkAll").prop("checked");
        $(".checkedId").each(function () {
            $(this).prop("checked", flag);
        });
        total();
    });

    /*    $(".checkedId").click(function () {
            var info = []
            $("input:checkbox:checked").each(function () {
                var obj = {};
                obj.mno=$('input[type=checkbox]:checked').closest('tr').find('td:eq(1)').map(function () {return this.innerHTML}).get().join();
                obj.mname=$('input[type=checkbox]:checked').closest('tr').find('td:eq(2)').map(function () {return this.innerHTML}).get().join();
                obj.mefficacy=$('input[type=checkbox]:checked').closest('tr').find('td:eq(3)').map(function () {return this.innerHTML}).get().join();
                obj.mprice=$('input[type=checkbox]:checked').closest('tr').find('td:eq(4)').map(function () {return this.innerHTML}).get().join();
                obj.num=$('input[type=checkbox]:checked').closest('tr').find('td:eq(5)').map(function () {return this.innerHTML}).get().join();
                obj.totalprice=$('input[type=checkbox]:checked').closest('tr').find('td:eq(6)').map(function () {return this.innerHTML}).get().join();
                info.push(obj)
            })
            console.log(info)
        });*/


    /*订单*/
    $(".buy").click(function () {
        var checked = $("input[class='checkedId']:checked");
        if (checked.length == 0) {
            swal("请至少选择一种药品")
        } else {
            swal({
                title: "您确定购买吗？",
                text: "购买药品",
                type: "info",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定购买！",
                cancelButtonText: "取消购买！",
                closeOnConfirm: false,
                closeOnCancel: false
            }, function (isConfirm) {
                if (isConfirm) {
                    var arr = [];
                    $("input[name='checkedId']:checked").each(function () {
                        var mno = $(this).parent().next().next().map(function () {
                            return this.innerHTML
                        }).get().join(",");
                        var mname = $(this).parent().next().next().next().map(function () {
                            return this.innerHTML
                        }).get().join(",");
                        var mefficacy = $(this).parent().next().next().next().next().map(function () {
                            return this.innerHTML
                        }).get().join(",");
                        var mprice = $(this).parent().next().next().next().next().next().map(function () {
                            return this.innerHTML
                        }).get().join(",");
                        var num = $(this).parent().next().next().next().next().next().next().map(function () {
                            return this.innerHTML
                        }).get().join(",");
                        var totalprice = $(this).parent().next().next().next().next().next().next().next().map(function () {
                            return this.innerHTML
                        }).get().join(",");
                        arr.push(mno);
                        $.ajax({
                            url: "./addOrderServlet",
                            data: {
                                mno: mno,
                                mname: mname,
                                mefficacy: mefficacy,
                                mprice: mprice,
                                num: num,
                                totalprice: totalprice
                            },
                            type: "post",
                            success: function () {
                                $.post("./deleteShopcartServlet", {mno: mno}, function () {
                                    swal({
                                            title: '购买成功',
                                            text: '成功购买了药品',
                                            type: 'success',
                                            confirmButtonText: '确定',
                                        },
                                        function () {
                                            location = 'findShopCartByPageServlet';
                                        }
                                    );
                                })
                            }
                        });
                    });
                } else {
                    swal("取消成功");
                }
            });
        }
    });


    /*删除所有*/
    $(".delAll").click(function () {
        var checked = $("input[class='checkedId']:checked");
        if (checked.length == 0) {
            swal("请至少选择一种药品")
        } else {
            swal({
                title: "您确定删除它们吗？",
                text: "删除所有药品",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定删除！",
                cancelButtonText: "取消删除！",
                closeOnConfirm: false,
                closeOnCancel: false
            }, function (isConfirm) {
                if (isConfirm) {
                    $("input[name='checkedId']:checked").each(function () {
                        var mno = $(this).parent().next().next().map(function () {
                            return this.innerHTML
                        }).get().join();
                        $.post("./deleteShopcartServlet", {mno: mno}, function () {
                            swal({
                                    title: '删除成功',
                                    text: '成功删除了药品',
                                    type: 'success',
                                    confirmButtonText: '确定',
                                },
                                function () {
                                    location = 'findShopCartByPageServlet';
                                }
                            );
                        })
                    });
                } else {
                    swal("取消成功");
                }
            });
        }
    });


});





/*导航栏选中效果*/
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

/*导航栏选中效果*/
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