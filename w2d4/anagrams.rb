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
  anagrams # O(1) time
end

def second_anagram?(string1, string2)
  until string1 == "" && string2 == ""
    char = string1[0]
    found = false
    string2.length.times do |idx|
      if char == string2[idx]
        string2 = string2[0...idx] + string2[idx + 1...string2.length]
        found = true
        break
      end
    end
    return false unless found
    string1 = string1[1...string1.length]
  end
  true
end

puts second_anagram?("abs", "sbb")
