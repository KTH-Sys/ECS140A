public abstract class Employee {
    protected String name;
    protected int id;

    public Employee (String name, int id) {
        this.name = name;
        this.id = id;
    }
    
    public abstract int calculatePay();

    public void printInfo(String name, int id){
        System.out.println(" Name: " + name);
        System.out.println("Emplyee ID:" + id);
    }
}
