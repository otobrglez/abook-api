# Basic ActiveRecord stuff... Nothing fancy,...
# However... You have all the power of AR here.
class Person < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true

  def to_s
    [first_name, last_name].join(' ').trim
  end
end