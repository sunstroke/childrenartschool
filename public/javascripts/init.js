jQuery.easing.easeOutQuart = function (x, t, b, c, d) {
	return -c * ((t=t/d-1)*t*t*t - 1) + b;
};

jQuery(function( $ ){
/**
 * No need to have only one element in view, you can use it for slideshows or similar.
 * In this case, clicking the images, scrolls to them.
 * No target in this case, so the selectors are absolute.
 */
$('#header').width($(window).width()*0.95);
$('#header').css('margin-left',$(window).width()*0.025);
$('#main').width($(window).width());
$('#slider').width($(window).width());
$('#buttons').width($(window).width()*0.9);
$('#slider li, #slider li img').width($('#slider').width());	
$('#slider_container').height($('#slider ul li').height());
$('#slider ul').width($('#slider').width()*$('#slider li').length);	
$('#slider').serialScroll({
	items:'li',
	prev:'#main a.prev',
	next:'#main a.next',
	offset:0, //when scrolling to photo, stop 230 before reaching it (from the left)
	start:0, //as we are centering it, start at the 2nd
	duration:2200,
	interval: 35000,
	force:true,
	stop:true,
	lock:false,
	cycle:false, //don't pull back once you reach the end
	easing:'easeOutQuart', //use this easing equation for a funny effect
	jump: true //click on the images to scroll to them
});

/**
 * The call below, is just to show that you are not restricted to prev/next buttons
 * In this case, the plugin will react to a custom event on the container
 * You can trigger the event from the outside.
 */
});