//= require jquery
//= require jquery_ujs
//= require jquery.ui-slider
//= require jquery.ui.all

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
	$( "#slider-range" ).slider({
			range: true,
			min: 5 ,
			max: 21,
			values: [ $("#group_age_start").val(), $("#group_age_finish").val() ],
			slide: function( event, ui ) {
				$( "#amount" ).val(  ui.values[ 0 ] + " - " + ui.values[ 1 ]+" лет" );
				$("#group_age_start").val(ui.values[ 0 ]);
				$("#group_age_finish").val(ui.values[ 1 ]);			
			}
		});
		$( "#amount" ).val(  $( "#slider-range" ).slider( "values", 0 ) +
			" - " + $( "#slider-range" ).slider( "values", 1 )+" лет" );
		$("#group_age_start").val($( "#slider-range" ).slider( "values", 0 ));
		$("#group_age_finish").val($( "#slider-range" ).slider( "values", 1 ));			
});

/* Russian (UTF-8) initialisation for the jQuery UI date picker plugin. */
/* Written by Andrew Stromnov (stromnov@gmail.com). */
jQuery(function($){
	$.datepicker.regional['ru'] = {
		closeText: 'Закрыть',
		prevText: '&#x3c;Пред',
		nextText: 'След&#x3e;',
		currentText: 'Сегодня',
		monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь',
		'Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
		monthNamesShort: ['Янв','Фев','Мар','Апр','Май','Июн',
		'Июл','Авг','Сен','Окт','Ноя','Дек'],
		dayNames: ['воскресенье','понедельник','вторник','среда','четверг','пятница','суббота'],
		dayNamesShort: ['вск','пнд','втр','срд','чтв','птн','сбт'],
		dayNamesMin: ['Вс','Пн','Вт','Ср','Чт','Пт','Сб'],
		weekHeader: 'Не',
		dateFormat: 'dd.mm.yy',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['ru']);
	
});
