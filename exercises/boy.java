public class boy extends people {
    public boy(String name, int age) {
        super(name, age);
    }
    @Override
    public void action() {
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println(name + " plays football.");
    }
}
