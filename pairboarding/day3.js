Array.prototype.myMap = function(func) {
  var mapped_array = [];
  this.forEach(function(el) {
    mapped_array.push(func(el));
  })
  return mapped_array;
}

// console.log([1,2,3].myMap(function(el) {
//   return el + 1;
// }));

function f() {
  return 12;
}

b = 7
a = b;
(f())
