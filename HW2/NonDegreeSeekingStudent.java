/**
 * Abstract class representing non-degree-seeking students
 */
public abstract class NonDegreeSeekingStudent extends Student {
    
    public NonDegreeSeekingStudent(String studentId, String firstName, String lastName,
                                   int age, int creditHours) {
        super(studentId, firstName, lastName, age, creditHours);
    }
    
    @Override
    public void printData() {
        System.out.println("ID number: " + studentId);
        System.out.println("Name: " + firstName + " " + lastName);
        System.out.println("Age: " + age);
    }
}
