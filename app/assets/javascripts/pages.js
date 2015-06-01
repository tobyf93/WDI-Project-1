$(document).ready(function() {
  $('html').on('click', 'a', 0);
});

var previewFile = function() {
  var cl_id = $(this).attr('data-cl');
  console.log(cl_id);

  if (cl_id) {
    $img = $('#filePreview img');
    var filePath = 'http://res.cloudinary.com/ddfua301o/image/upload/' + cl_id;
    $img.attr('src', filePath);
  }
};