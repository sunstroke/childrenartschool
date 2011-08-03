jQuery.easing.easeOutQuart = function (x, t, b, c, d) {
	return -c * ((t=t/d-1)*t*t*t - 1) + b;
};

jQuery(function( $ ){
	
	
	$('#section').serialScroll({
		target:'#default',
		items:'h2', // Selector to the items ( relative to the matched elements, '#sections' in this case )
		prev:'img.prev',// Selector to the 'prev' button (absolute!, meaning it's relative to the document)
		next:'img.next',// Selector to the 'next' button (absolute too)
		axis:'xy',// The default is 'y' scroll on both ways
		navigation:'#sidemenu a',
		duration:700,// Length of the animation (if you scroll 2 axes and use queue, then each axis take half this time)
		force:true, // Force a scroll to the element specified by 'start' (some browsers don't reset on refreshes)
		
		//queue:false,// We scroll on both axes, scroll both at the same time.
		//event:'click',// On which event to react (click is the default, you probably won't need to specify it)
		//stop:false,// Each click will stop any previous animations of the target. (false by default)
		//lock:true, // Ignore events if already animating (true by default)		
		//start: 0, // On which element (index) to begin ( 0 is the default, redundant in this case )		
		//cycle:true,// Cycle endlessly ( constant velocity, true is the default )
		//step:1, // How many items to scroll each time ( 1 is the default, no need to specify )
		//jump:false, // If true, items become clickable (or w/e 'event' is, and when activated, the pane scrolls to them)
		//lazy:false,// (default) if true, the plugin looks for the items on each event(allows AJAX or JS content, or reordering)
		//interval:1000, // It's the number of milliseconds to automatically go to the next
		//constant:true, // constant speed
		
		onBefore:function( e, elem, $pane, $items, pos ){
			/**
			 * 'this' is the triggered element 
			 * e is the event object
			 * elem is the element we'll be scrolling to
			 * $pane is the element being scrolled
			 * $items is the items collection at this moment
			 * pos is the position of elem in the collection
			 * if it returns false, the event will be ignored
			 */
			 //those arguments with a $ are jqueryfied, elem isn't.
			e.preventDefault();
			if( this.blur )
				this.blur();
		},
		onAfter:function( elem ){
			//'this' is the element being scrolled ($pane) not jqueryfied
		}
	});
	
	
	
/**
 * No need to have only one element in view, you can use it for slideshows or similar.
 * In this case, clicking the images, scrolls to them.
 * No target in this case, so the selectors are absolute.

$('#header').width($(window).width()*0.95);
$('#header').css('margin-left',$(window).width()*0.025);
 */
$('#main').width($(window).width());
$('#slider').width($(window).width());
$('#buttons').width($(window).width()*0.9);
$('#caption li,#slider li, #slider li img').width($('#slider').width());	
$('#slider_container').height($('#slider ul li').height());
$('#slider ul, #caption ul').width($('#slider').width()*$('#slider li').length);	
$('#slider').serialScroll({
	items:'li',
	prev:'#buttons a.prev',
	next:'#buttons a.next',
	offset:0, //when scrolling to photo, stop 230 before reaching it (from the left)
	start:0, //as we are centering it, start at the 2nd
	duration: 1500,
	force:false,
	stop:true,
	lock:false,
	lazy:true,
	cycle:true, //don't pull back once you reach the end

	jump: false //click on the images to scroll to them
});

/**
 * The call below, is just to show that you are not restricted to prev/next buttons
 * In this case, the plugin will react to a custom event on the container
 * You can trigger the event from the outside.
 */
});

			/*
			 * stickyfloat - jQuery plugin for verticaly floating anything in a constrained area
			 * 
			 * Example: jQuery('#menu').stickyfloat({duration: 400});
			 * parameters:
			 * 		duration 	- the duration of the animation
			 *		startOffset - the amount of scroll offset after it the animations kicks in
			 *		offsetY		- the offset from the top when the object is animated
			 *		lockBottom	- 'true' by default, set to false if you don't want your floating box to stop at parent's bottom
			 * $Version: 05.16.2009 r1
			 * Copyright (c) 2009 Yair Even-Or
			 * vsync.design@gmail.com
			 */

			$.fn.stickyfloat = function(options, lockBottom) {
				var $obj 				= this;
				var parentPaddingTop 	= parseInt($obj.parent().css('padding-top'));
				var startOffset 		= $obj.parent().offset().top;
				var opts 				= $.extend({ startOffset: startOffset, offsetY: parentPaddingTop, duration: 200, lockBottom:true }, options);
				
				$obj.css({ position: 'absolute' });
				
				if(opts.lockBottom){
					var bottomPos = $obj.parent().height() - $obj.height() + parentPaddingTop; //get the maximum scrollTop value
					if( bottomPos < 0 )
						bottomPos = 0;
				}
				
				$(window).scroll(function () { 
					$obj.stop(); // stop all calculations on scroll event

					var pastStartOffset			= $(document).scrollTop() > opts.startOffset;	// check if the window was scrolled down more than the start offset declared.
					var objFartherThanTopPos	= $obj.offset().top > startOffset;	// check if the object is at it's top position (starting point)
					var objBiggerThanWindow 	= $obj.outerHeight() < $(window).height();	// if the window size is smaller than the Obj size, then do not animate.
					
					// if window scrolled down more than startOffset OR obj position is greater than
					// the top position possible (+ offsetY) AND window size must be bigger than Obj size
					if( (pastStartOffset || objFartherThanTopPos) && objBiggerThanWindow ){ 
						var newpos = ($(document).scrollTop() -startOffset + opts.offsetY );
						if ( newpos > bottomPos )
							newpos = bottomPos;
						if ( $(document).scrollTop() < opts.startOffset ) // if window scrolled < starting offset, then reset Obj position (opts.offsetY);
							newpos = parentPaddingTop;
			
						$obj.animate({ top: newpos }, opts.duration );
					}
				});
			};
			$('#sidemenu').stickyfloat({ duration: 400 });
			$("h1, h2, h3").each(function(i) {
			    var current = $(this);
			    current.attr("id", "title" + i);
			    $("#sidemenu").append("<a id='link" + i + "' href='#title" +
			        i + "' title='" + current.attr("tagName") + "'>" + 
			        current.html() + "</a><br/>");
			});

