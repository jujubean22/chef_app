module ChefsHelper

  def charged(balance)
    balance = balance * 0.2
  end

  def payment(balance)
    balance = balance * 0.8
  end
end
