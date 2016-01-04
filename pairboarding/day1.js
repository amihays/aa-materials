function digitalRoot(num) {
  while (num >= 10) {
    var sum = 0;
    var temp = num;
    while (temp > 0) {
      var remainder = temp % 10;
      sum += remainder;
      temp = (temp - remainder) / 10;
    }
    num = sum;
  }
  return num;
}

function caesarCipher(string, shift) {
  var alpha = "abcdefghijklmnopqrstuvwxyz";
  var new_string = "";
  for (i = 0; i < string.length; i++) {
    if (string[i] === " ") {
      new_string += " ";
    } else {
      var old_idx = alpha.split("").indexOf(string[i]);
      var new_idx = (old_idx + shift) % alpha.length;
      new_string += alpha[new_idx];
    }
  }
  return new_string;
}

function commonSubstrings(str1, str2) {
  var longest = "";
  for (startIdx = 0; startIdx < str1.length; startIdx++) {
    for (diff = longest.length + 1; startIdx + diff < str1.length + 1; diff++) {
      var substring = str1.slice(startIdx, startIdx + diff);
      var start2 = 0;
      while (start2 < str2.length - diff + 1) {
        if (str2.slice(start2, start2 + diff) === substring) {
          longest = substring;
        }
        start2 += 1;
      }
    }
  }
  return longest;
}

function sum_rec(nums) {
  if (nums.length === 0) {
    return 0;
  }
  return nums[0] + sum_rec(nums.slice(1));
}
