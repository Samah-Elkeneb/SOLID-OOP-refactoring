# Refactoring Explanation

This document explains how the project was refactored to follow SOLID principles and clean OOP design.

---

## 1. Original Problem

The original invoice processing code was tightly coupled and mixed several responsibilities in one place.  
Problems included violations of SOLID principles:
- **SRP:** One class handled calculation, payment, logging, and notifications.
- **OCP:** Adding new payment methods required modifying existing code.
- **DIP:** High-level module depended on concrete classes instead of abstractions.
- **ISP & LSP:** No clear interfaces, subclasses could not safely replace parents.

Adding features (new payment methods, loggers, notifiers) required modifying existing classes, making the system hard to maintain and extend.

---

## 2. Refactoring Steps

### ✔️ Step 1 — Separate Responsibilities
Created dedicated classes:
- Payment classes: `VisaPayment`, `CashPayment`, `PaypalPayment`
- Logger classes: `FileLogger`
- Notifier classes: `EmailNotifier`
- Dedicated `TaxCalculator`

This ensures each class has a **single responsibility** and simplifies maintenance.

---

### ✔️ Step 2 — Introduce Interfaces
Created interfaces:
- `PaymentInterface`
- `LoggerInterface`
- `NotifierInterface`

Each concrete class implements one interface.  
This reduces coupling and ensures that **high-level modules depend on abstractions, not concrete implementations** (DIP & ISP).  
It also ensures safe substitution of subclasses (LSP).

---

### ✔️ Step 3 — Dependency Injection
Instead of creating objects inside `InvoiceProcessor`, we now inject:
- payment method  
- logger  
- notifier  

This makes the system **flexible and testable**, allowing mocks for testing external actions.

---

### ✔️ Step 4 — Cleaner Tax Handling
Moved tax logic into `TaxCalculator`.  
- Improves readability and testability.  
- Supports country-specific tax rates without changing `InvoiceProcessor`.

---

### ✔️ Step 5 — Final Architecture

invoice_processor.rb
│
├── tax_calculator.rb
├── payments/
│   ├── payment_interface.rb
│   ├── visa_payment.rb
│   ├── cash_payment.rb
│   ├── paypal_payment.rb
│
├── services/
│   ├── logging/
│   │   ├── logger_interface.rb
│   │   ├── file_logger.rb
│   │
│   ├── notifiers/
│       ├── notifier_interface.rb
│       ├── email_notifier.rb



This folder structure makes it easy to locate responsibilities and extend the system without modifying core logic.

---

## 3. Benefits of the Refactoring

- **Extensible:** Add new payment/logging/notification classes without changing core code.
- **Testable:** All behaviors injectable, external actions can be mocked.
- **SRP Compliance:** Each class has a single responsibility.
- **Isolation of Side Effects:** File writing and email sending are handled in dedicated classes.
- **Clean Architecture:** Reduces duplication and coupling.
- **Fully SOLID:** Respects all principles (SRP, OCP, LSP, ISP, DIP).

