# 💎 SOLID & OOP Refactoring

A refactored Ruby project that demonstrates how to apply SOLID principles and clean OOP design to an invoice processing system.

---

## 📌 Project Purpose

This project transforms a tightly coupled implementation into a fully modular and extensible architecture using:

- Object-Oriented Programming
- SOLID Principles
- Dependency Injection
- Interfaces (Duck Typing)
- Clean folder structure

---

## 📂 Project Structure

invoice_processor.rb
tax_calculator.rb
payments/
  payment_interface.rb
  visa_payment.rb
  cash_payment.rb
  paypal_payment.rb
services/
  logging/
    logger_interface.rb
    file_logger.rb
  notifiers/
    notifier_interface.rb
    email_notifier.rb
SOLID_violations.md
refactoring_explanation.md
README.md

---

## 🧾 Features

- ✅ Multiple payment methods (Visa, Cash, PayPal)  
- ✅ File-based logging  
- ✅ Email notifications  
- ✅ Tax calculation (Egypt vs others)  
- ✅ Fully extensible design  
- ✅ Follows all SOLID principles  

---

## ▶️ How to Run

```sh
ruby main.rb
```

## 🚀 Example Usage

```ruby
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

processor.process
```

### Expected Output:

When you run the processor, you should see messages like the following in your terminal:

```sh
Paid using VISA
Email sent to ahmed@mail.com: thanks for your purchase
```

Note:

The invoice is also logged in invoice_log.txt with content like:
User: Ahmed, Total: 57.0

## 🤝 Contribution

Feel free to fork and add:

- More payment types
- SMS or WhatsApp notifier
- JSON or Database logger
- Country-based tax strategy

---
