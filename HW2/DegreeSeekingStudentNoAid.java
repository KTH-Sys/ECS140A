/**
 * Class representing degree-seeking students without financial assistance
 */
public class DegreeSeekingStudentNoAid extends DegreeSeekingStudent {
    
    public DegreeSeekingStudentNoAid(String studentId, String firstName, String lastName,
                                     int age, int creditHours, String major, String academicStanding) {
        super(studentId, firstName, lastName, age, creditHours, major, academicStanding);
    }
    
    @Override
    public void printData() {
        super.printData();
        System.out.println(firstName + "'s major is " + getMajorName(major));
        System.out.println(firstName + "'s academic standing is " + getStandingName(academicStanding) + ".");
    }
}
