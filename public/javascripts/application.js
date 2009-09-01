$(document).ready(function() {
  var keyword = $.qtm.keywordFromUrl(document.referrer);
  if (keyword) {
    $("h1 + p")
      .after($("<div/>")
        .addClass("qtm-link")
        .append($("<p/>").text("We see you're researching ")
        .append($("<span/>").text(unescape(keyword.replace(/\+/g, " "))))
        .append("."))
        .append($("<p/>")
          .text("If this page doesn't solve your problem, why not ")
          .append($.qtm.link(
              "effectif", "effectif-development", "tell us what you really need"))
          .append("? We'd&nbsp;love to write that article for you&hellip;"))
        .hide()
        .fadeIn(1000));
  }
});
