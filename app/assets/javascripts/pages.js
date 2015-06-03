$(document).ready(function() {
  $('html').on('click', '#fileList a', previewFile);
  $('#discover #fileUpload').on('change', function() { 
    var $input = $(this),
    numFiles = $input.get(0).files ? $input.get(0).files.length : 1,
    label = $input.val().replace(/\\/g, '/').replace(/.*\//, '');
    $input.trigger('fileselect', [numFiles, label]);

    $('#discover #fileName').attr('placeholder', label);
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