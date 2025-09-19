class LoanData {
  static final List<Map<String, String>> loans = [
    {"title": "Personal Loan", "status": "Approved"},
    {"title": "Car Loan", "status": "Pending"},
    {"title": "Business Loan", "status": "Approved"},
    {"title": "Education Loan", "status": "Rejected"},
  ];

  static Map<String, int> getLoanStats() {
    int total = loans.length;
    int approved = loans.where((l) => l["status"] == "Approved").length;
    int pending = loans.where((l) => l["status"] == "Pending").length;
    int rejected = loans.where((l) => l["status"] == "Rejected").length;

    return {
      "total": total,
      "approved": approved,
      "pending": pending,
      "rejected": rejected,
    };
  }

  static void rejectLoan(int index) {
    loans[index]["status"] = "Rejected";
  }

  static void rejectAllPending() {
    for (var loan in loans) {
      if (loan["status"] == "Pending") {
        loan["status"] = "Rejected";
      }
    }
  }
}
