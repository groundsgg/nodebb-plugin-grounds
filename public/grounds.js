'use strict';

// The bar's new-topic button: the composer for the category being read, or
// with a category picker anywhere else (app.newTopic picks ajaxify.data.cid).
$(document).on('click', '[component="grounds/new-topic"]', function () {
	app.newTopic();
});
