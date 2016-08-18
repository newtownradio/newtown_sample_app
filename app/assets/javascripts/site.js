 var d = document.createElement("div");
  a = document.createTextNode(a);
  d.appendChild(a);
  a = document.createElement("div");
  b = document.createTextNode(b);
  a.appendChild(b);
  b = document.createElement("div");
  b.appendChild(d);
  b.appendChild(a);
  c.appendChild(b);
}
function makeNotes(a, b) {
  for (var c = 0;c < a.length;c++) {
    makeNoteDom(a[c].title, a[c].content, b);
  }
}
function main() {
  var a = document.getElementById("notes");
  makeNotes([{title:"Note 1", content:"Content of Note 1"}, {title:"Note 2", content:"Content of Note 2"}], a);
}
main();
$(document).on("ready page:load", function() {
  $(".rating").raty({path:"/assets", scoreName:"comment[rating]"});
  $(".rated").raty({path:"/assets", readOnly:!0, score:function() {
    return $(this).attr("data-score");
  }});
  $("#zoom_01").elevateZoom();
});
