$(document).ready(function () {
    let count = 0;

    $("#btnmore").click(function (event) {
        const category = $("#mycat").text();
        count += 1;

        event.preventDefault();


        $.ajax({
            type: "GET",
            url: `/api/product/?category=${category}&page=${count}`,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (response) {
                console.log("SUCCESS :");

                let result = response.results

                for (let each in result) {

                    $("#myproduct").append(
                        ` <div class="col-md-4 mb-4">
                                    <div class="card text-center">
                                        <!--product image and badge-->
                                        <a href="{% url 'product:detail' product.id %}" class="product-box_image"
                                           title="{{ product.name }}">
                                            <img class="img-fluid" width="280" height="100"
                                                 src="media/{{ product.iamge }}"
                                                 alt="{{ product.name }}">
                                            <div class="swiper-lazy-preloader swiper-lazy-preloader-dark"></div>
                                            <div class="product-box_discount"><span>%19<small>تخفیف</small></span></div>
                                        </a>
            
            
                                        <!--product image and badge end-->
            
            
                                        <div class="card-body">
                                            <!--product title-->
                                            <a href="{% url 'product:detail' product.id %}"
                                               class="product-box_title text-dark" title="{{ product.name }}">
                                                <h2 style="font-size: 0.85rem">${result[each]['name']}</h2>
                                            </a>
                                            <!--product title end-->
            
                                            <!--price-->
                                            <a href="{% url 'product:detail' product.id %}"
                                               title="{{ product.price }}">
                                                <del>220,000</del>
                                                <div class="product-box_price-value text-secondary">${result[each]['price']}
                                                    <span class="product-box_price-currency">تومان</span>
                                                </div>
                                            </a>
                                            <!--price end-->
            
                                            <!--action-->
                                            <div class="product-box_action">
                                                <button type="button"
                                                        class="btn btn-primary add-to-cart gtm-add-to-cart pr-8 pl-8"
                                                        id="gtm-add-to-cart">
                                                    <i class="ico ico-color_plus-circle filter-none"></i>
                                                    افزودن به سبد
                                                </button>
                                            </div>
                                            <!--action btn-->
                                        </div>
                                    </div>
                              </div>
                               

`)

                    console.log(result[each])
                }


            },

            error: function (error) {
                console.log("ERROR : ", error);

            }
        });

    });
});