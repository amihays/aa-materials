class WordChainer
  def initialize(dictionary_file)
    @dictionary = File.readlines(dictionary_file).map { |line| line.chomp }
  end

  def adjacent_words(word)
    @dictionary.select do |dict_word|
      diffs = 0
      dict_word.length.times do |i|
        diffs += 1 if dict_word[i] != word[i]
      end
      diffs == 1 && dict_word.length == word.length
    end
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }
    until @current_words.empty? || @all_seen_words[target]
      explore_current_words
    end
    build_path(target).join(" => ")
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|
        unless @all_seen_words.include?(adjacent_word)
          @all_seen_words[adjacent_word] = current_word
          new_current_words.push(adjacent_word)
        end
      end
    end
    new_current_words.each { |word| puts "#{word} => #{@all_seen_words[word]}" }
    @current_words = new_current_words
  end

  def build_path(target)
    path = []
    current_word = target
    until current_word.nil?
      path.push(current_word)
      current_word = @all_seen_words[current_word]
    end
    path
  end
end

wc = WordChainer.new("dictionary.txt")
puts wc.run("market", "backer")
