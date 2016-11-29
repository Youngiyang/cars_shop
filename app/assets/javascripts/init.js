$(document).ready(function(){
  // init pjax
  $(function() {
       // $(document).pjax('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])', '#content');
  });

  $('.menu-toggle').on('click', function(e){
    $('.orion-bootstrap-admin').hasClass('toggled') ?
      $('.orion-bootstrap-admin').removeClass('toggled') :
        $('.orion-bootstrap-admin').addClass('toggled');
  });
  $('ul.sidebar-nav li a').on('click', function(e){
    $(this).attr('aria-expanded') === 'true' ?
      $(this).children('i').removeClass('fa-chevron-down').addClass('fa-chevron-up') :
        $(this).children('i').removeClass('fa-chevron-up').addClass('fa-chevron-down');
  });
  $('ul.sidebar-nav>li').on('click', function(e){
    $(this).hasClass('active') ? true :
      $(this).addClass('active').siblings().removeClass('active');
  });

  // 手机号码验证
  jQuery.validator.addMethod("isMobile", function(value, element) {
      var length = value.length;
      var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
      return this.optional(element) || (length == 11 && mobile.test(value));
  }, "请正确填写您的手机号码");
  //验证手机或座机
  jQuery.validator.addMethod("isPhone", function(value, element) {
    var length = value.length;
    var mobile = /^(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
    return this.optional(element) || (mobile.test(value));
  }, "请正确填写您的手机号码或座机号");

  $.datepicker.regional["zh-CN"] = {
    closeText: "关闭",
    prevText: "&#x3c;上月",
    nextText: "下月&#x3e;",
    currentText: "今天",
    monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
    monthNamesShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
    dayNames: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
    dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],
    dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"],
    weekHeader: "周",
    dateFormat: "yy-mm-dd",
    firstDay: 1,
    isRTL: !1,
    showMonthAfterYear: !0,
    yearSuffix: "年"
  }



  $.datepicker.setDefaults($.datepicker.regional["zh-CN"]);

});
