class Hash
  def prepend(key, value)
    self[key] = self.has_key?(key) ? "#{value} #{self[key]}" : value
    self
  end

  def append(key, value)
    self[key] = self.has_key?(key) ? "#{self[key]} #{value}" : value
    self
  end

  def to_markup
    self.map{|key, value| "#{key}=\"#{value}\""}.join(' ')
  end
end