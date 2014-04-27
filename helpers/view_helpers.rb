module HelpMeOut
  module ViewHelpers
    def show_error_message
      "<p class='lead text-error spacer'>#{@error}</p>" if @error
    end

    def show_success_message
      "<p class='lead text-success spacer'>#{@success}</p>" if @success
    end

    def create_array_for_expenses_chart(categories, expenses)
      categories = expenses.map do |expenses_group|
        expenses_group.first.category.name if expenses_group.size.nonzero?
      end
      sums = expenses.map do |expenses_group|
        expenses_group.map { |expense| expense.price }.reduce(:+)
      end
      categories.zip(sums)
    end

    def date_to_string(date)
      date.strftime("%d/%m/%Y")
    end

    def find_field_name(field_id)
      Field.find(id: field_id).name
    end
  end
end
