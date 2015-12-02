class Array
  def my_each
    self.length.times { |i| yield self[i] }
    self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |el|
      selected << el if prc.call(el)
    end
    selected
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |el|
      rejected << el unless prc.call(el)
    end
    rejected
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    flattened = []
    self.each do |el|
      el.is_a?(Array) ? flattened.concat(el.my_flatten) : flattened.push(el)
    end
    flattened
  end

  def my_zip(*args)
    zipped = []
    self.each_with_index do |el, idx|
      new_row = [el]
      args.each { |arg| new_row.push(arg[idx]) }
      zipped.push(new_row)
    end
    zipped
  end

  def my_rotate(diff = 1)
    split_idx = diff % self.length
    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(separator = '')
    joined = ""
    self.length.times do |i|
      joined += self[i]
      joined += separator unless i == self.length - 1
    end
    joined
  end

  def my_reverse
    reversed = []
    i = self.length - 1
    while i >= 0
      reversed.push(self[i])
      i -= 1
    end
    reversed
  end
end
