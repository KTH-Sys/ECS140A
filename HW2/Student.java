/**
 * Abstract base class representing a student at Tonopah State University
 */
public abstract class Student {
    protected String studentId;
    protected String firstName;
    protected String lastName;
    protected int age;
    protected int creditHours;
    
    public Student(String studentId, String firstName, String lastName, int age, int creditHours) {
        this.studentId = studentId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.creditHours = creditHours;
    }
    
    // Abstract methods to be implemented by subclasses
    public abstract void printData();
    public abstract double computeFees();
    
    // Getter methods
    public String getStudentId() { return studentId; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public int getAge() { return age; }
    public int getCreditHours() { return creditHours; }
}
