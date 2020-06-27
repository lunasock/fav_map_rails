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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

$(window).scroll(function(){
  $('.fadein').each(function(){
    // scrollTop()でスクロールした時の位置(スクロール量)を取得
    var scroll = $(window).scrollTop();
    // offset().topでHTML要素が配置されているY座標を取得
    // thisはaboutのbox
    var element = $(this).offset().top;
    // $(window).height()でウィンドウの高さを値として取得
    var windowHeight = $(window).height();
    if (scroll > element - windowHeight + 100){
      $(this).addClass('scrollin');
    }
  });
});