require_relative 'tax_calculator'

class InvoiceProcessor
  def initialize(user, items, payment_method, logger, notifier)
    @user = user
    @items = items
    @payment_method = payment_method
    @logger = logger
    @notifier = notifier
  end

  def process
    total = TaxCalculator.new(@items).calculate_total_with_tax(@user.country)

    @payment_method.pay

    @logger.log(@user, total)

    @notifier.send_notification(@user)

  end
end