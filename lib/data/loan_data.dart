import '../models/loan.dart';

class LoanData {
  static List<Loan> loans = [];

  static void addLoan(Loan loan) {
    loans.add(loan);
  }

  static List<Loan> getLoans() {
    return loans;
  }
}
