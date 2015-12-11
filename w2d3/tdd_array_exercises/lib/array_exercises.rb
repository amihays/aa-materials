class Array
  def my_uniq
    unique = []
    each { |el| unique << el unless unique.include?(el) }
    unique
  end
end
