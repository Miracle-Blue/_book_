class Account {
  int id;
  int sum;
  Account(this.id, this.sum);
}

class Transaction<T extends Account> {
  T fromAccount; // o'tkazish hisob raqami
  T toAccount; // o'tish hisob raqami
  int sum; // o'tkazma summasi

  Transaction(this.fromAccount, this.toAccount, this.sum);

  void execute() {
    if (fromAccount.sum > sum) {
      fromAccount.sum -= sum;
      toAccount.sum += sum;
      print(
          " Hisob raqam ${fromAccount.id}: ${fromAccount.sum}\$ \n Hisob raqam ${toAccount.id}: ${toAccount.sum}\$");
    } else {
      print("Hisobda yetarli mablag' mavjud emas ${fromAccount.id}");
    }
  }
}

void main() {
  Account acc1 = Account(1857, 4500); // sum = 4500;
  Account acc2 = Account(3453, 5000); // sum = 5000;
  Transaction transaction = Transaction<Account>(acc1, acc2, 1900);
  transaction.execute();
}
