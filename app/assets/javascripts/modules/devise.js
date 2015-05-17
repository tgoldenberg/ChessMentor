$(function() {
  $(":file").filestyle({buttonText: " Upload avatar", buttonBefore: true});

  $('#pictureInput').on('change', function(event) {
   var files = event.target.files;
   var image = files[0]
   var reader = new FileReader();
   reader.onload = function(file) {
     var img = new Image();
     img.width = 100;
     console.log(file);
     img.src = file.target.result;
     $('#target').html(img);
   }
   reader.readAsDataURL(image);
 });
});
