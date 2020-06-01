<!-- 悬浮窗 -->

//显示悬浮层
function showInform(){
    document.getElementById("inform").style.display='block';
    // document.getElementById("inform").css("display","block");
}
//隐藏悬浮层
function hiddenInform(event){
    var informDiv = document.getElementById('inform');
    var x=event.clientX;
    var y=event.clientY;
    var divx1 = informDiv.offsetLeft;
    var divy1 = informDiv.offsetTop;
    var divx2 = informDiv.offsetLeft + informDiv.offsetWidth;
    var divy2 = informDiv.offsetTop + informDiv.offsetHeight;
    if( x < divx1 || x > divx2 || y < divy1 || y > divy2){
        document.getElementById('inform').style.display='none';

    }

}
$(function () {
    var belonging = getParameter("belonging");
    $.get("/getFinishedStudents",{"belonging":belonging}, function (data) {
        var html = '<tr><th>已分</th></th></tr>';
        // alert(data[0].type);
        for (var i=0; i<data.length; i++){
            html += '<tr style="background-color: #dff0d8;\n' +
                '}\n' +
                '\n"><td>'+data[i].type+'</td><td>'+data[i].num+'</td><tr/>'
        }
        $("#finishStudents").html(html)
    })

    $.get("/getUnfinishStudents",{"belonging":belonging}, function (data) {
        var html = '<tr><th>未分</th></th></tr>';
        // alert(data[0].type);
        for (var i=0; i<data.length; i++){
            html += '<tr style="background-color: #fcf8e3;\n' +
                '}\n"><td>'+data[i].type+'</td><td>'+data[i].num+'</td><tr/>'
        }
        $("#unfinishStudents").html(html)
    })
});

function getParameter(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
    var r = location.search.substr(1).match(reg);
    if (r!=null) return (r[2]); return null;
}