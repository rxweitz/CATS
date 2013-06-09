module ApplicationHelper
  def parse_error(error_message)
    # If it's a CATS trigger error, then return only the CATS error.
    if error_message.index("ORA-20000:")
      start_position = error_message.index("ORA-20000:") + 10
      end_position = error_message.index("ORA-",start_position) - 1
      error_message[start_position..end_position]
    else
      # If it's not a CATS trigger error, then return the whole message.
      error_message
    end
  end
end
