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
            // console.log(data);
            for (let key in data) {
                // console.log(data[key]["amount"]);
                if (data[key]["code"] == discount_code) {
                    $("#discount").html(data[key]['amount'])
                    $("#discount").append('%')
                    // console.log(data[key]["amount"]);
                    // $("#total_price").html(data['total_price'])
                    const TotalPrice = $('#span_price').html();
                    console.log(TotalPrice);
                    const DiscountCodeAmount = (data[key]["amount"])
                    // const TotalPrice = document.getElementById('total_price');
                    // const TotalPrice = $('#total_price').html();
                    // const TotalPrice = $('#total_price').text();
                    // var TotalPrice = $('#total_price').val();
                    // console.log(TotalPrice)
                    // const TotalPrice = 644130
                    const discount = TotalPrice * DiscountCodeAmount / 100
                    const totalPriceAfterDiscount = (TotalPrice - discount)
                    $('#final_price').text(`${totalPriceAfterDiscount}`)
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

