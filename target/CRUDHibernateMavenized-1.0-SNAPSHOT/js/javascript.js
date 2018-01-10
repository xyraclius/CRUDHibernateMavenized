/* global swal, form */

function onlyNumeric(event) {
    var key = window.event ? event.keyCode : event.which;
    if (event.keyCode >= 8 || event.keyCode === 46 || event.keyCode === 37 || event.keyCode === 39) {
        return true;
    } else if (key < 48 || key > 57) {
        return false;
    } else
        return true;
}

function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        } else if (e) {
            var charCode = e.which;
        } else {
            return true;
        }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123 || charCode <= 10 || charCode === 32))
            return true;
        else
            return false;
    } catch (err) {
        alert(err.Description);
    }
}

function getRandomInt(min, max) {
    var x = Math.floor(Math.random() * (100000 - 10000) + 10000);
    document.getElementById('id').value = x;
}


var fade_out = function () {
    $("#clearMessage").fadeOut().empty();
};
setTimeout(fade_out, 4000);
