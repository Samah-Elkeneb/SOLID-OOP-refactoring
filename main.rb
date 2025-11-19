require 'ostruct'
require_relative 'invoice_processor'
require_relative 'tax_calculator'
require_relative 'payments/visa_payment'
require_relative 'payments/paypal_payment' 
require_relative 'payments/cash_payment'
require_relative 'services/logging/file_logger' 
require_relative 'services/notifiers/email_notifier' 

processor = InvoiceProcessor.new(
  OpenStruct.new(name: "Ahmed", country: "EG", email: "ahmed@mail.com"),
  [
    { price: 10, quantity: 2 },
    { price: 30, quantity: 1 }
  ],
  VisaPayment.new,
  FileLogger.new,
  EmailNotifier.new
)

processor1 = InvoiceProcessor.new(
  OpenStruct.new(name: "Mohamed", country: "EG", email: "mohamed@mail.com"),
  [
    { price: 20, quantity: 3 },
    { price: 50, quantity: 2 }
  ],
  CashPayment.new,
  FileLogger.new,
  EmailNotifier.new
)

processor2 = InvoiceProcessor.new(
  OpenStruct.new(name: "Mahmoud", country: "KW", email: "mahmoud@mail.com"),
  [
    { price: 30, quantity: 2 },
    { price: 40, quantity: 2 }
  ],
  PaypalPayment.new,
  FileLogger.new,
  EmailNotifier.new
)

processor.process
processor1.process
processor2.process