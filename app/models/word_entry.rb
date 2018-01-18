class WordEntry < ApplicationRecord
  def word=(new_value)
    super
    self.canonical = new_value.split('').sort.join
  end
end
