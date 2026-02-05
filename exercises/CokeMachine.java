public class CokeMachine { // Class
    private int numOfCans; // Instance Variable

    public CokeMachine() { // Constructor
        numOfCans = 2;
        System.out.println("Add new coke machine.");
    }

    public void reloadMachine(int loadCans) { // Method
        numOfCans = loadCans;
    }

    public void buyCoke() {
        if (numOfCans > 0) {
            numOfCans = numOfCans - 1;
            System.out.println("Have a Coke");
            System.out.print(numOfCans);
            System.out.println(" cans remaining");
        } else {
            System.out.println("Sold Out");
        }
    }

    public int getCoke() { // getter: allows outside access to private data
        return numOfCans;
    }
}