class Condition < ActiveRecord::Base

  # I'm not sure why this is necessary, but without this the ID ends up as a decimal
  # value instead of an integer.
  def to_param
    conditionid.to_i
  end

  # These are required because the CATS naming scheme is different from the standard
  # Rails naming scheme.
  set_table_name 'cats_condition'
  set_primary_key 'conditionid'
  set_sequence_name 'cats_conditionid'

  # Only the conditioncode and description fields are accessible to the user.
  attr_accessible :conditioncode, :description

  # Since data is always saved in uppercase, we want to convert the entered value to uppercase.
  # However, we want to do this before we check for the uniqueness of the conditioncode.
  # That's why it's in a before_validation callback.
  before_validation do
    self.conditioncode.upcase!
    self.description.upcase!
  end

  # These validations are the same as the ones in the database (validation trigger and
  # and unique index).  We are duplicating these here so that the user does not see the
  # Oracle error messages.

  # The conditioncode and description values are mandatory.
  validates_presence_of :conditioncode
  validates_presence_of :description

  # Verify that the conditioncode is unique
  validates_uniqueness_of :conditioncode

  # Since the fields in the database are only 50 characters long, prevent the user from
  # entering values longer than this.
  validates_length_of :conditioncode, :maximum => 50
  validates_length_of :description, :maximum => 50

end
