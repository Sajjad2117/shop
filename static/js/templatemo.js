/*
TemplateMo 559 Zay Shop
https://templatemo.com/tm-559-zay-shop
*/

'use strict';
$(document).ready(function () {



    // Product detail

    $('#btn-minus').click(function () {
        var val = $("#var-value").html();
        val = (val == '1') ? val : val - 1;
        $("#var-value").html(val);
        $("#product-quanity").val(val);
        return false;
    });
    $('#btn-plus').click(function () {
        var val = $("#var-value").html();
        var max = $("#product-number").html();
        if (val < max){
           val++;
        }
        $("#var-value").html(val);
        $("#product-quanity").val(val);
        return false;
    });

    // End roduct detail

});