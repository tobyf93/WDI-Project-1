$(document).ready(function() {
  $('html').on('click', '#fileList a', previewFile);
  $('#discover #fileUpload').on('change', function() { 
    var filename = $(this).val().replace(/C:\\fakepath\\/i, '');
    $('#discover #fileName').val(filename);
  });
});

var previewFile = function() {
  var $this = $(this);
  var cl_id = $this.attr('data-cl');

  if (cl_id) {
    $img = $('#filePreview img');
    var filePath = 'http://res.cloudinary.com/ddfua301o/image/upload/' + cl_id;
    $img.attr('src', filePath);

    $('#fileList a').removeClass('active');
    $this.addClass('active');
  } else {
    $this.remove();
  }
};