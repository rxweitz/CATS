class Condition < ActiveRecord::Base

  def to_param
    conditionid.to_i
  end

  set_table_name 'cats_condition'
  set_primary_key 'conditionid'
  set_sequence_name 'cats_conditionid'
  attr_accessible :conditioncode, :description

  before_validation do
    self.conditioncode.upcase!
    self.description.upcase!
  end

  # the conditioncode and description are mandatory
  validates_presence_of :conditioncode
  validates_presence_of :description

  # conditioncode must be unique
  validates_uniqueness_of :conditioncode

end
