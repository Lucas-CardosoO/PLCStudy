import java.util.Random;

public class UserContaThread extends Thread {
    Random random = new Random();
    public Conta c;

    public UserContaThread(Conta c) {
        this.c = c;
    }

    public void run() {
        for (int i = 0; i < 10; i++) {
            int newRandom = random.nextInt(2);

            if (newRandom == 0) {
                int randomCredit = random.nextInt(500);
                c.creditar(randomCredit);
                System.out.println("Crédito: " + randomCredit + " Thread: " + Thread.currentThread().getName() + " Saldo: " + c.getSaldo());
            } else {
                int randomDebit = random.nextInt(500);
                c.debitar(randomDebit);
                System.out.println("Débito: " + randomDebit + " Thread: " + Thread.currentThread().getName() + " Saldo: " + c.getSaldo());
            }
        }
    }
}
