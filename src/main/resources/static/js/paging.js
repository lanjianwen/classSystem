var currentPage = $("#currentPage").val();
var totalPages = $("#totalPages").val();
var pageSize = $("#pageSize").val();
var li = '';
var beforePage = currentPage - 1;
if (beforePage <= 0){
    beforePage = 1;
}
if (currentPage != 1){
    li += '<li>\n' +
        '                        <a href="findTeachers?page=1" aria-label="Previous">\n' +
        '                            <span aria-hidden="true">首页</span>\n' +
        '                        </a>\n' +
        '                    </li>';

    li += '<li>\n' +
        '                        <a href="findTeachers?page='+beforePage+'" aria-label="Previous">\n' +
        '                            <span aria-hidden="true">上一页</span>\n' +
        '                        </a>\n' +
        '                    </li>';
}
else {
    li += '<li class="disabled">\n' +
        '      <span>\n' +
        '        <span aria-hidden="true">首页</span>\n' +
        '      </span>\n' +
        '    </li>';

    li += '<li class="disabled">\n' +
        '      <span>\n' +
        '        <span aria-hidden="true">上一页</span>\n' +
        '      </span>\n' +
        '    </li>';
}

var begin;
var end;

if (totalPages < 10){
    begin = 1;
    end = totalPages;
}
else {
    begin = currentPage - 5;
    end = currentPage + 4;
    //如果前边不够5个，后边补齐10个
    if(begin < 1){
        begin = 1;
        end = begin + 9;
    }
    //如果后边不足4个，前边补齐10个
    if(end > totalPages){
        end = totalPages;
        begin = end - 9 ;
    }
}
for (var i = begin; i <= end; i++) {
    if (currentPage == i){
        li += '<li class="active">\n' +
            '      <span>'+i+' <span class="sr-only">(current)</span></span>\n' +
            '    </li>';
    }
    else {
        li += '<li><a href="findTeachers?page='+i+'">'+i+'</a></li>';
    }

}
var nextPage = parseInt(currentPage) + 1;
if (nextPage > totalPages){
    nextPage = nextPage - 1;
}
if (currentPage == totalPages){
    li += '<li class="disabled">\n' +
        '      <span>\n' +
        '        <span aria-hidden="true">下一页</span>\n' +
        '      </span>\n' +
        '    </li>';

    li += '<li class="disabled">\n' +
        '      <span>\n' +
        '        <span aria-hidden="true">尾页</span>\n' +
        '      </span>\n' +
        '    </li>';
}
else {
    li += '<li>\n' +
        '                        <a href="findTeachers?page='+nextPage+'" aria-label="Next">\n' +
        '                            <span aria-hidden="true">下一页</span>\n' +
        '                        </a>\n' +
        '                    </li>';
    li += '<li>\n' +
        '                        <a href="findTeachers?page='+totalPages+'" aria-label="Next">\n' +
        '                            <span aria-hidden="true">尾页</span>\n' +
        '                        </a>\n' +
        '                    </li>';
}
$(".pagination").html(li);