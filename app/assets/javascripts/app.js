var app = angular.module('shop', ['ngResource']);

$(document).on('turbolinks:load', function(){
	angular.bootstrap(document.body, ['shop'])
});
app.factory('models', ['$resource', function($resource){
  var orders_model = $resource("/orders/:id.json", {id: "@id"});
  var products_model = $resource("/products/:id.json", {id: "@id"});
  var x = {
  	orders: orders_model,
  	products: products_model
  };
  return x;
}]);
app.controller('OrdersCtrl', ['$scope', 'models', function($scope, models){
  // Here will be all code belonging to this controller
$scope.products = models.products.query();
$scope.newOrder = function(){
	if (!$scope.newOrder.product_id || $scope.newOrder.total === ''){ return; }
	order = models.orders.save($scope.newOrder, function(){
	  recent_order = models.orders.get(order.id);
	  $scope.orders.push(recent_order);
	  $scope.newOrder = '';
	});
};
$scope.deleteOrder = function(order){
	models.orders.delete(order);
	$scope.orders.splice($scope.orders.indexOf(order), 1);
};	
}]);

