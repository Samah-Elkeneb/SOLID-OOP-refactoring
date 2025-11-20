# SOLID Violations in the Original Code

Below are the main SOLID principles that were violated in the original invoice processing code.

---

## 1. Single Responsibility Principle (SRP)

### ❌ Problem:
`InvoiceProcessor` was doing too many jobs:
- Calculating tax  
- Processing payment  
- Logging  
- Sending notifications  

### ✔️ Fix:
Split responsibilities:
- `TaxCalculator` → handles tax  
- Payment classes → handle payment  
- Logger classes → handle logging  
- Notifier classes → handle notifications  
- `InvoiceProcessor` now only coordinates the workflow

---

## 2. Open/Closed Principle (OCP)

### ❌ Problem:
The payment logic was using `if / elsif` to determine which payment method to use.

### ✔️ Fix:
Created a `PaymentInterface` and concrete payment classes  
→ Add new payment methods without touching existing code.

---

## 3. Liskov Substitution Principle (LSP)

### ❌ Problem:
Without a shared interface for payment, logger, and notifier, you couldn’t substitute one for another safely.

### ✔️ Fix:
- `PaymentInterface`
- `LoggerInterface`
- `NotifierInterface`

Any implementation can now be swapped safely.

---

## 4. Interface Segregation Principle (ISP)

### ❌ Problem:
There were no clear interfaces.  
Classes depended on methods they did not necessarily need.

### ✔️ Fix:
Created small, focused interfaces:
- `PaymentInterface`  
- `LoggerInterface`  
- `NotifierInterface`  

---

## 5. Dependency Inversion Principle (DIP)

### ❌ Problem:
`InvoiceProcessor` was depending on concrete classes:
- `Logger`
- `Notifier`
- Specific payment classes

### ✔️ Fix:
Now it depends on **abstractions**, not concrete implementations:
- Injected via constructor (logger, notifier, payment_method)

This makes the system fully modular and extendable.

