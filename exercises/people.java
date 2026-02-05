public abstract class people {
    protected String name;
    protected int age;

    public people(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public abstract void action();

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }
}
