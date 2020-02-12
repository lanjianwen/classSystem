function exeData(num, type) {
    loadData(num);
    loadpage();
}
function loadpage() {
    var myPageCount = parseInt($("#PageCount").val());
    var myPageSize = parseInt($("#PageSize").val());
    var countindex = myPageCount % myPageSize > 0 ? (myPageCount / myPageSize) + 1 : (myPageCount / myPageSize);
    $("#countindex").val(countindex);

    $.jqPaginator('#pagination', {
        totalPages: parseInt($("#countindex").val()),
        visiblePages: parseInt($("#visiblePages").val()),
        currentPage: parseInt($("#currentPage").val()),
        first: '<li class="first"><a  href="findTeachers?page={{page}}">首页</a></li>',
        prev: '<li class="prev"><a href="findTeachers?page={{page}}"><i class="arrow arrow2"></i>上一页</a></li>',
        next: '<li class="next"><a href="findTeachers?page={{page}}">下一页<i class="arrow arrow3"></i></a></li>',
        last: '<li class="last"><a  href="findTeachers?page={{page}}">末页</a></li>',
        page: '<li class="page"><a  href="findTeachers?page={{page}}">{{page}}</a></li>',
        onPageChange: function (num, type) {
            if (type == "change") {
                exeData(num, type);
            }
        }
    });
}
$(function () {
    loadData(1);
    loadpage();
});


