$(document).ready(function(){
  alert("I'm working");
  console.log("work");
  $('#hit_form input').click(function(){
    alert('hit button clicked!');
    return false;
  });
});