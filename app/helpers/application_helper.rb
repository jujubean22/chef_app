module ApplicationHelper
  def convert_to_money(number)
    number_to_currency(number, unit: "Php", precision: 2, delimiter: ",", format: "%u %n")
  end

  def format_date(date)
    date.strftime("%B %d, %Y (%I:%M %p)")
  end
end
