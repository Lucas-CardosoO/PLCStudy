import java.util.concurrent.atomic.*;

public class ContaPrim {
    private AtomicInteger saldo;

    public void Conta() {
        this.saldo = new AtomicInteger(0);
    }

    public void creditar(int credito) {
        System.out.println(this.saldo.addAndGet(credito));
    }

    public void debitar(int debito) {
//        if (debito > this.saldo.get()) {
//            System.out.println("Saldo Insuficiente");
//        } else {
//            this.saldo.getAndAdd(-debito);
//        }
        this.saldo.updateAndGet(a -> (a - debito) > 0 ? (a - debito) : a);
    }

    public int getSaldo() {
        return this.saldo.get();
    }


}