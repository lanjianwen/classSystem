function updatePassword(user) {

    $("#ud_username").val(user.username)
    $("#ud_rolename").val(user.roles.name)
    $("#ud_id").val(user.id)

}

function subData() {
    var id = $("#ud_id").val();
    var username = $("#ud_username").val();
    var password = $("#ud_password").val();
    var lastPassword = $("#ud_lastPassword").val();
    $.post("/updatePassword",{"id": id,
        "username": username,
        "password": password,
        "lastPassword": lastPassword},function (data) {
        alert(data);
        location.reload()
    })
}