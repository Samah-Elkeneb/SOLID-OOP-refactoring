require_relative 'payment_interface'

class PaypalPayment < PaymentInterface

  def pay
    puts "Paid using PayPal"
  end

end