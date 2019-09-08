class Word < ApplicationRecord

  validates_presence_of :name
  validates_uniqueness_of :name
  before_validation :downcase_for_uniqueness

  def downcase_for_uniqueness
    self.name.downcase!
  end

  def increase_count
    self.count += 1
    self.save!
  end

end