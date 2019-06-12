public class Conta {
    private int saldo;

    public void Conta() {
        this.saldo = 0;
    }

    public synchronized void creditar(int credito) {
        this.saldo += credito;
    }

    public synchronized void debitar(int debito) {
        if (debito > this.saldo) {
            System.out.println("Saldo Insuficiente");
        } else {
            this.saldo -= debito;
        }
    }

    public synchronized int getSaldo() {
        return this.saldo;
    }
}
