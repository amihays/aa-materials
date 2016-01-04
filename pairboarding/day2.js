function fibs(num) {
  if (num === 0) {
    return [];
  } else if (num === 1) {
    return [0];
  }

  var fibs = [0, 1];
  while (fibs.length < num) {
    var new_fib = fibs[fibs.length - 1] + fibs[fibs.length - 2];
    fibs.push(new_fib);
  }

  return fibs;
}

// function isPalindrome(string) {
//   var i = 0;
//   var j = string.length - 1;
//   while (i < string.length && i <= j) {
//     while (string[i] === " ") {
//       i += 1;
//     }
//     while (string[j] === " ") {
//       j -= 1;
//     }
//     if (string[i] !== string[j]) {
//       return false;
//     }
//     i += 1;
//     j -= 1;
//   }
//   return true;
// }

function valid_ip(str) {
  var nums = str.split(".");
  if (nums.length !== 4) {
    return false;
  }
  for (i = 0; i < nums.length; i++ ) {
    var num = parseInt(nums[i]);
    if (typeof(num) !== 'number' || num !== num || num < 0 || num > 255) {
      return false;
    }
  }
  return true;
}
//
// def sum_from_file(path)
//   lines = File.readlines(path)
//   lines.inject(0) { |accum, line| accum + line.to_i }
// end

function isPalindrome(string) {
  var i = 0;
  var j = string.length - 1;
  while (i < j) {
    while (string[i] === " ") {
      i += 1;
    }
    while (string[j] === " ") {
      j -= 1;
    }
    if (string[i] !== string[j]) {
      return false;
    }
    i += 1;
    j -= 1;
  }
  return true;
}
