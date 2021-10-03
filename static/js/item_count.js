var itemCount = 0;

$('#addcart').click(function (){
  itemCount ++;
  $('#itemCount').html(itemCount).css('display', 'block');
});