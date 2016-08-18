function makeNoteDom(a, b, c) {
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
var app = angular.module("shop", ["ngResource"]);
$(document).on("turbolinks:load", function() {
  angular.bootstrap(document.body, ["shop"]);
});
app.factory("models", ["$resource", function(a) {
  var b = a("/orders/:id.json", {id:"@id"});
  a = a("/products/:id.json", {id:"@id"});
  return {orders:b, products:a};
}]);
app.controller("OrdersCtrl", ["$scope", "models", function(a, b) {
  a.orders = b.orders.query();
  a.products = b.products.query();
  a.addOrder = function() {
    a.newOrder.product_id && "" !== a.newOrder.total && (order = b.orders.save(a.newOrder, function() {
      recent_order = b.orders.get({id:order.id});
      a.orders.push(recent_order);
      a.newOrder = "";
    }));
  };
  a.deleteOrder = function(c) {
    b.orders["delete"](c);
    a.orders.splice(a.orders.indexOf(c), 1);
  };
}]);
©2009 Google - Terms of Service - Privacy Policy - Google Home
