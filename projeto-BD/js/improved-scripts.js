
// Small UI helpers: mobile menu toggle and simple toast
document.addEventListener('DOMContentLoaded', function(){
  // mobile menu toggles
  var btn = document.querySelector('[data-toggle="mobile-menu"]');
  if(btn){
    btn.addEventListener('click', function(e){
      e.preventDefault();
      var t = document.querySelector('#mobileMenu');
      if(t) t.classList.toggle('open');
    });
  }
});
