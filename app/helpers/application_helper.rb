module ApplicationHelper
  def parse_oracle_error(message)
    start_position = message.index("ORA-20000:") + 10
    end_position = message.index("ORA-",start_position+1) - 1
    message[start_position..end_position]
  end
end
