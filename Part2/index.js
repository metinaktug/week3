module.exports= function(){
    
    var d = new Date().getTime();
  
   
    var guid = 'xxxxxxxxxxxxxxxxxxxx'.replace(/[x]/g, function(c) {
      var r = (d + Math.random()*16)%16 | 0;
      d = Math.floor(d/16);
      return (c=='x' ? r : (r&0x3|0x8)).toString(16);
    });
  
    
    return guid
  };