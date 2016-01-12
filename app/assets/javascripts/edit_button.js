$(document).ready( function () {
  $(".edit_post").on('click', function(){
    $('#edit_tr').show();
  });
  $(".edit_submit").on('click', function(){
    var inp = $(this).parent().parent().children().children().val(); //gives input's value
    $(this).parent().parent().prev().children().first().text(inp); //replace content of td
    $(this).parent().parent().fadeOut(500);
  });
  // $(".create_post").on('click', function(){
  // });
});

