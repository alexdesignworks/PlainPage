/**
 * Main Javascript file
 * Used by all pages
 *
 * Author: 
 * Last modified:  
 * Version:  
 */

$(document).ready(function(){
	//Apply PNG fix
  $(document).pngFix(); 
  
  //Hide non-js and show js-based elements
  $('.no-js-support').hide();
  $('.js-support ').show();  
  
});
