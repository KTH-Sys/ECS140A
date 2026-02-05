public class SimCoke {
    public static void main(String[] args) {
        CokeMachine machine = new CokeMachine(); // Object

        System.out.println("Initial Can:" + machine.getCoke());
        machine.buyCoke();
        machine.buyCoke();
        machine.buyCoke();

        machine.reloadMachine(10);
        System.out.println(machine.getCoke());
        machine.buyCoke();
    }
}
