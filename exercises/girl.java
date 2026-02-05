public class girl extends people {
    public girl(String name, int age) {
        super(name, age);
    }
    @Override
    public void action() {
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println(name + " reads books.");
    }
}
