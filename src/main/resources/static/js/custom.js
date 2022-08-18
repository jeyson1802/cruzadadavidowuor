/*

	Template Name: Eventech -  Conference & Event HTML Template
	Author: Tripples
	Version: 1.1

	1. Preloader
	2. Mobile Menu
	3. Main Slideshow
	4. Gallery popup
	5. Counter
	6. Contact form
	7. Back to top
  
*/


jQuery(function($) {
  "use strict";

  	/* ----------------------------------------------------------- */
	/*  Preload
	/* ----------------------------------------------------------- */

	function handlePreloader() {

		const loader = document.querySelector(".page-loader");

		if (loader) {

			loader.classList.add("slide-off");
			//activarEstiloOpcionSeleccionado();
			//generarEnlacesFooter();
			setTimeout(function () {
				loader.classList.add("is-loading-finish");
				loader.remove();
			}, 2000)

		}
	}


	/* ----------------------------------------------------------- */
	/*  Mobile Menu
	/* ----------------------------------------------------------- */

	jQuery(".nav.navbar-nav li a").on("click", function() { 
		jQuery(this).parent("li").find(".dropdown-menu").slideToggle();
		jQuery(this).find("i").toggleClass("fa-angle-down fa-angle-up");
	});


	/* ----------------------------------------------------------- */
	/*  Main slideshow
	/* ----------------------------------------------------------- */

		$('#main-slide').carousel({
			pause: true,
			interval: 100000,
		});


	/* ----------------------------------------------------------- */
	/*  Gallery popup
	/* ----------------------------------------------------------- */

	  $(document).ready(function(){

			$(".gallery-popup").colorbox({rel:'gallery-popup', transition:"fade", innerHeight:"700"});

			$(".popup").colorbox({iframe:true, innerWidth:650, innerHeight:450});

			  /*$(".countdown").jCounter({
				  date: '21 October 2022 12:00:00',
				  fallback: function () {
					  console.log("count finished!")
				  }
			  });*/

	  });



	/* ----------------------------------------------------------- */
	/*  Counter
	/* ----------------------------------------------------------- */

		/*$('.counterUp').counterUp({
		 delay: 10,
		 time: 1000
		});*/

	/* ----------------------------------------------------------- */
	/*  Back to top
	/* ----------------------------------------------------------- */

		/* Preloade */

		$(window).on('load', function() {
			handlePreloader();
		});


});