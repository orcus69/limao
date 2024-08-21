class ModuleEntity {
  final int id;
  final String title;
  final double amount;
  final DateTime date;

  ModuleEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}

class BudgetEntity {
  final double budget;
  final double available;
  final double accumulated;

  BudgetEntity({
    required this.budget,
    required this.available,
    required this.accumulated,
  });
}
