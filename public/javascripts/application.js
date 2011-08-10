// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var redactor = { 
  focus: true, 
  path: '/redactor/', 
  image_upload: '/manage/photos', 
  pathCss: 'css/', 
  css: ['base.css'] 
}
$(function() { 
$.datepicker.setDefaults($.datepicker.regional['ru']);	
 $(".date").datepicker({dateFormat:'yy-mm-dd'});


});