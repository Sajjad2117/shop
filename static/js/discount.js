$('#discount_form').on('submit', function (e) {
    var form = $(this);
    var url = '/api/order/discount-code/'
    let discount_code = $('#discount_code').val()
    let user_id = $('#user_id').val()
    e.preventDefault();
    $.ajax({
        type: "GET",
        url: url,
        data: JSON.stringify({
            'code': discount_code,
            'user_id': user_id,
        }),
        success: function (data) {

            for (let key in data) {
                // console.log(data[key]["amount"]);
                if (data[key]["code"] == discount_code) {
                    $("#discount").html(data[key]['amount'])
                    $("#discount").append('%')
                } else {
                    $("#error").html('This discount code is not valid')
                }
            }
        },
        error: function (error) {
            console.log("ERROR : ", error);
        },
        contentType: "application/json",
        dataType: 'json',
    });
});

