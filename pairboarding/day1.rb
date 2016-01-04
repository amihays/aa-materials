def digital_root(num)
  until num < 10
    digit_sum = 0
    partial_num = num
    until partial_num == 0
      digit_sum += partial_num % 10
      partial_num /= 10
    end
    num = digit_sum
  end
  num
end

def caesar_cipher(string, shift)
  string.split('').map do |char|
    if char.ord.between?("a".ord, "a".ord + 25)
      ((((char.ord + shift) - "a".ord) % 26) + "a".ord).chr
    else
      char
    end
  end.join('')
end

def common_substrings(str1, str2)
  longest = ""
  str1.length.times do |start_idx|
    end_idx = start_idx + longest.length
    while end_idx < str1.length
      longest = str1[start_idx..end_idx] if str2.include?(str1[start_idx..end_idx])
      end_idx += 1
    end
  end
  longest
end

def sum_rec(array)
  return 0 if array.empty?
  array.first + sum_rec(array.drop(1))
end

def fibs(num)
  fibs = [0, 1]
  return fibs.take(num) if num <= 2
  until fibs.length == num
    fibs.push(fibs[-1] + fibs[-2])
  end
  fibs
end

def is_palindrome?(string)
  i, j = 0, string.length - 1
  while i < j
    i += 1 until string[i] != " "
    j -= 1 until string[j] != " "
    return false if string[i] != string[j]
    i += 1
    j -= 1
  end
  true
end
