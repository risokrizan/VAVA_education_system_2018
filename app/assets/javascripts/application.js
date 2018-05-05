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
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require materialize

//= require jquery3
//= require popper
//= require bootstrap

$(document).ready(function() {
    $("#btnExport").click(function(e) {
        e.preventDefault();

        //getting data from our table
        var data_type = 'data:application/vnd.ms-excel';
        var table_div = document.getElementById('tableWrapper');
        var table_html = table_div.outerHTML.replace(/ /g, '%20');

        var a = document.createElement('a');
        a.href = data_type + ', ' + table_html;

        var date = new Date();
        var today = date.getDate() + "-" + (date.getMonth()+1) + "-" + (date.getFullYear());
        a.download = "znamky_" + today + '.xls';
        a.click();
    });
});

$('.alert').alert();


