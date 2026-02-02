/**
 * Class representing senior citizen students
 */
public class SeniorCitizen extends NonDegreeSeekingStudent {
    
    public SeniorCitizen(String studentId, String firstName, String lastName,
                        int age, int creditHours) {
        super(studentId, firstName, lastName, age, creditHours);
    }
    
    @Override
    public void printData() {
        super.printData();
        System.out.println(firstName + " is a senior citizen student enrolled in " + creditHours + " credits.");
    }
    
    @Override
    public double computeFees() {
        if (creditHours <= 6) {
            return 100.0;
        } else {
            return 100.0 + ((creditHours - 6) * 50.0);
        }
    }
}
