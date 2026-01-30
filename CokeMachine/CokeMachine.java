public class CokeMachine {  //class

    public int numberOfCans; //instance variable

    public CokeMachine() { //construtor method
        numberOfCans = 2;
        System.out.println("Adding another machine to your empire");
    }

    public void buyCoke() { //method
        if (numberOfCans > 0) {
            numberOfCans = numberOfCans - 1;
            System.out.println("Have a Coke");
            System.out.print(numberOfCans);
            System.out.println(" cans remaining");
        }
        else
        {
            System.out.println("Sold Out");
        }
    }
}
