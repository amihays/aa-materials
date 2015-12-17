def first_anagram?(string1, string2) # O(n!) time
  anagrams(string1).include?(string2)  # O(m) time where m is the number of anagrams
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
  anagrams # O(1) time
end

p first_anagram?("abc", "cbb")
