// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require cable
//= require_tree ./channels
//= require jquery
//= require rails-ujs
//= require jquery.turbolinks
//= require materialize-sprockets
//= require init
//= require gmaps/google
//= require custom_gmaps
//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions
//= require abracadabra
//= require cocoon


function printPage() {
    window.print()
}

$(document).ready(function() {
    var phones = [{ "mask": "(###) ###-####"}];
    $('.phone-text').inputmask({
        mask: phones,
        greedy: false,
        showMaskOnHover: false,
        definitions: { '#': { validator: "[0-9]", cardinality: 1}} });

    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        closeOnSelect: false // Close upon selecting a date,
    });

    $('#header-dropdown').click(function() {
        Materialize.Toast.removeAll();
    });

    $('.brand-logo').hover(function() {
        $('.white-logo').hide();
        $('.blue-logo').show();
    }, function() {
        $('.blue-logo').hide();
        $('.white-logo').show();
    });

    // Backdoor to go home. Press SHIFT+DEV
    var map = {16:false, 68: false, 69: false, 86: false};
    $(document).keydown(function(e) {
        if (e.which in map) {
            map[e.which] = true;
            if (map[16] && map[68] && map[69] && map[86]) {
                window.location.href = "/";
            }
        }
    }).keyup(function(e) {
        if (e.which in map) {
            map[e.which] = false;
        }
    });
});