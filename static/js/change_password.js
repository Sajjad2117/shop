$(document).ready(function () {

    $("#changePasswordBtn").click(function (event) {

        event.preventDefault();

        const form = $('#change_password_form')[0];
        const data = new FormData(form);

        $.ajax({
            type: "PUT",
            enctype: 'multipart/form-data',
            url: "/api/user/change_password/",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function () {
                console.log("SUCCESS :");
                alert('Your password was successfully changed.')
                window.location = '/customer/login/';
            },
            error: function (error) {
                console.log("ERROR : ", error);
                $(".alert").remove();

            }
        });

    });
});
