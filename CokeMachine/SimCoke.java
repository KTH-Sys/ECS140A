public class SimCoke {
    public static void main(String[] args) {

        // create objects
        CokeMachine csMachine   = new CokeMachine();
        CokeMachine engrMachine = new CokeMachine();

        // simulate buying coke
        csMachine.buyCoke();
        csMachine.buyCoke();
        csMachine.buyCoke();

        engrMachine.buyCoke();
        engrMachine.buyCoke();
    }
}
