require_relative 'payment_interface'

class CashPayment < PaymentInterface

  def pay
    puts "Paid using CASH"
  end

end