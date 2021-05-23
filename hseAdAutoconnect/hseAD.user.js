(function(window, undefined ) {
	var w;
	if (unsafeWindow != "undefined"){
		w = unsafeWindow 
	} else {
		w = window;	
	}

	if (w.self != w.top){
		return;
	}

	if (/https:\/\/wifi.mts.ru/.test(w.location.href)) {
		var confirmClickEvent = document.createEvent('MouseEvents');
		confirmClickEvent.initEvent('click', true, true);
		var confirmBtn = document.querySelector(
			"#confirm-checkbox"
			);
		confirmBtn.dispatchEvent(confirmClickEvent);

		var submitClickEvent = document.createEvent('MouseEvents');
		submitClickEvent.initEvent('click', true, true);
		var submitBtn = document.querySelector(
			"#main-form > div:nth-child(8) > button"
			);
		submitBtn.dispatchEvent(submitClickEvent);
	}
})(window);