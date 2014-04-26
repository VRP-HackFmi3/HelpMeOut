module HelpMeOut
  module WebsiteHelpers
    def set_message(message, template, type = :error)
      type == :error ? @error = message : @success = message
      haml template
    end

    def redirect_home
      redirect '/'
    end

    def to_sentence(errors)
      errors.full_messages.flatten.join(', ')
    end

    def date_string_to_int(string)
      Time.parse(string).to_i
      # Date.strptime(string, '%m/%d/%Y ')
    end

    def current_month_date_range
      today      = Date.today
      start_date = Date.new(today.year, today.month,  1)
      end_date   = Date.new(today.year, today.month, -1)
      start_date..end_date
    end
  end
end
