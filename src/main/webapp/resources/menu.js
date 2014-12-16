
$(document).ready(function () {
    var popupElement = '<div class="btn-group btn-toggle"><button class="btn btn-sm btn-info">On</button><button class="btn btn-sm btn-primary active">Off</button></div>';

    $('#create_meal').popover({
        animation: true,
        content: popupElement,
        html: true
    });


});
