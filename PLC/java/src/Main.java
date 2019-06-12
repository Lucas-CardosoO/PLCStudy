public class Main {
    public static void main(String[] args) throws InterruptedException {
        Conta conta = new Conta();
        UserContaThread[] user = new UserContaThread[6];

        for (int i = 0; i < user.length; i++) {
            user[i] = new UserContaThread(conta);
            user[i].start();
        }

        for (int i = 0; i < user.length; i++) {
            user[i].join();
        }

        System.out.println("Saldo: " + conta.getSaldo());
    }
}