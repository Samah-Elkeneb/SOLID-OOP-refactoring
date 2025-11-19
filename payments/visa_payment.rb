require_relative 'payment_interface'

class VisaPayment < PaymentInterface

  def pay
    puts "Paid using VISA"
  end

end