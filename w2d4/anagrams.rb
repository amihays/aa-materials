def first_anagram?(string1, string2) # O(n!) time and O(n!) space
  anagrams(string1).include?(string2)
end

def anagrams(string) # O(n!) time & O(n!) space
  return [string] if string.length == 1 # O(1) time
  anagrams = [] # O(1) time
  string.length.times do |idx| # O(n) time
    partial_string = string[0...idx] + string[idx + 1...string.length] # O(n) time and O(n) space
    partial_anagrams = anagrams(partial_string) # O((n - 1)!) time
    new_anagrams = partial_anagrams.map { |str| string[idx] + str } # O((n - 1)!) time and space
    anagrams.concat(new_anagrams) # O((n - 1)!) time and space
  end
  anagrams
end

def second_anagram?(string1, string2) # O(n^2) time, O(n) space
  arr1, arr2 = string1.split(''), string2.split('')
  until arr1.empty? && arr2.empty?
    char = arr1.shift # O(n) time, O(n) space
    found = false
    arr2.each_index do |idx| # O(n) time
      if char == arr2[idx]
        arr2.delete_at(idx) # O(n) time, O(n) space
        found = true
        break
      end
    end
    return false unless found
  end
  true
end


def third_anagram?(string1, string2) # O(nlogn) time, O(n) space
  str1, str2 = sort(string1), sort(string2)
  str1 == str2
end

def sort(string)  # O(nlogn) time, O(n) space
  string.split('').sort.join('')
end
