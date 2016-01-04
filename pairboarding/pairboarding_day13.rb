
# Given a string containing just the characters '(', ')', '{', '}', '[' and ']',
# determine if the input string is valid.
# The brackets must close in the correct order, "()" and "()[]{}"
# are all valid but "(]" and "([)]" are not.

def is_valid?(string)
  open_brackets = []
  string.each_char do |char|
    if ["(", "{", "["].include?(char)
      open_brackets.push(char)
    elsif [")", "}", "]"].include?(char)
      last = open_brackets.pop
      if ((last == "[" && char != "]") ||
          (last == "(" && char != ")") ||
          (last == "{" && char != "}"))
        return false
      end
    else
      return false
    end
  end
  true
end

p is_valid?("((()))")
p is_valid?("((}))")
p is_valid?("(({)})")
p is_valid?("((()[]))")
