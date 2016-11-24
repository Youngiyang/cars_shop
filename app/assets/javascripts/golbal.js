var basecar = {
  closeMask: function(mask,window1,window2) {
    $(document).click(function(e) {
      if(e.target.className === 'zy-backdrop'|| e.target.className === 'zy-window-close') {
        $(window1).hide();
        $(window2).hide();
        $(mask).hide();
      }
    })
  },
  openWindow: function(el,mask,window) {
    $(el).click(function(){
      $(mask).show();
      $(window).show();
    })
  },
  closeWindow: function(el,mask,window) {
    $(el).click(function(){
      $(mask).hide();
      $(window).hide();
    })
  },
  Shink: function(el,show,hide){
    $(el).click(function(){
      $(hide).hide(500);
      $(show).show();
     })
  }
}