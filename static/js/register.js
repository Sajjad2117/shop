$(document).ready(function () {

    $("#signupbtn").click(function (event) {
        event.preventDefault();

        const form = $('#signup_form')[0];

        const data = new FormData(form);


        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/api/user/register/",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function () {
                alert(data['username'] + ' ' + 'register is success')
                window.location = '/customer/register/';
            },
            error: function (error) {
                console.log("ERROR : ", error);


            }
        });

    });
});

