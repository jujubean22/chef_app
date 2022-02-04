module ApplicationHelper
  def convert_to_money(number)
    number_to_currency(number, unit: "Php", precision: 2, delimiter: ",", format: "%u %n")
  end
end
