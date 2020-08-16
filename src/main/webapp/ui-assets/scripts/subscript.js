$("li[data-target='#myModal']").on('click',function(){
    $(".modal-body").html($(this).attr('data-content'));
  });