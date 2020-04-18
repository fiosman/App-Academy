console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  method: "GET",
  url:"http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success: function(data) { 
    console.log(`Weather in ${data.name}: ${data.weather[0].description}`); 
  }, 
  error: function() { 
    console.log('UH OH SOMETHING BROKE!'); 
  }
});

// Add another console log here, outside your AJAX request
console.log('THIS GETS PRINTED BEFORE THE AJAX REQUEST IS FINISHED EXECUTING')