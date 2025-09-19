class Loan {
  final String loanType;
  final double amount;
  final int duration; // months
  final DateTime date;

  Loan({
    required this.loanType,
    required this.amount,
    required this.duration,
    required this.date,
  });
}
