$(document).ready(function() {
  var keyword = $.qtm.keywordFromUrl(document.referrer);
  if (keyword) {
    $("h1 + p")
      .after($("<div/>").addClass("qtm-link")
        .append($("<p/>").text("So you're researching ")
          .append($("<span/>").text(unescape(keyword.replace(/\+/g, " "))))
          .append(", eh?"))
        .append($("<p/>").text("If this article doesn't solve your problem, why not ")
          .append($.qtm.link("effectif", "effectif-development", "tell us what you really need"))
          .append("?")));
  }
});
