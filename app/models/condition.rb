class Condition < ActiveRecord::Base

  def to_param
    conditionid.to_i
  end

  set_table_name 'cats_condition'
  set_primary_key 'conditionid'
  set_sequence_name 'cats_conditionid'
  attr_accessible :conditioncode, :description
end
