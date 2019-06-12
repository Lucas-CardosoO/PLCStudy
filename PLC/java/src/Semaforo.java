public class Semaforo {
    private int count;

    public Semaforo(int start) {
        this.count = start;
    }

    public synchronized void up() {
        while (count <= 0) {
            try {
                wait();
            } catch (InterruptedException ex) {

            }
        }
        count--;
    }

    public synchronized void up() {
        count++;
        if (count == 1) {
            notify();
        }
    }

}
