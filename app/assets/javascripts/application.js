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
//= require activestorage
//= require turbolinks
//= require plugins/jquery/jquery-3.2.1.min
//= require jquery
//= require jquery_ujs
//= require plugins/modernizr.custom
//= require plugins/jquery-ui/jquery-ui.min
//= require plugins/popper/umd/popper.min
//= require plugins/bootstrap/js/bootstrap.min
//= require plugins/bootstrap-daterangepicker/daterangepicker
//= require plugins/bootstrap-datepicker/js/bootstrap-datepicker
//= require plugins/jquery/jquery-easy
//= require plugins/jquery-unveil/jquery.unveil.min
//= require plugins/jquery-ios-list/jquery.ioslist.min
//= require plugins/jquery-actual/jquery.actual.min
//= require plugins/jquery-scrollbar/jquery.scrollbar.min
//= require plugins/select2/js/select2.full.min
//= require plugins/classie/classie
//= require plugins/switchery/js/switchery.min
//= require plugins/jquery-validation/js/jquery.validate.min
//= require plugins/sweetalert2/sweetalert2.all.min
//= require plugins/chartjs/chartjs.min
//= require pages/js/pages
//= require pages/core/js/scripts
//= require chart
//= require jquery.slimscroll.min
//= require jquery.dataTables.min
//= require dataTables.bootstrap.min


//= require_tree .

$(document).ready(function(e) {
  // data table
  var default_number_column_sotring = $("#default_number_column_sotring").attr('data-number');
  if (typeof(default_number_column_sotring) == "undefined"){
    default_number_column_sotring = 0;
  }

  $('.adminlte2datatable').DataTable();

  //hide and unbind icon sort in table
  $(".remove-icon-sorting").removeClass('sorting_desc').removeClass('sorting').unbind();
});
