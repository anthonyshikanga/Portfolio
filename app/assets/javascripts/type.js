document.addEventListener("turbolinks:load", function() {
 alert("ok!")
});

$('#example1').typeIt({
     strings: 'This is a simple string.',
     speed: 50,
     autoStart: true
}); 