/**
 * Abstract class representing degree-seeking students
 */
public abstract class DegreeSeekingStudent extends Student {
    protected String major;
    protected String academicStanding;
    
    public DegreeSeekingStudent(String studentId, String firstName, String lastName, 
                                int age, int creditHours, String major, String academicStanding) {
        super(studentId, firstName, lastName, age, creditHours);
        this.major = major;
        this.academicStanding = academicStanding;
    }
    
    @Override
    public void printData() {
        System.out.println("ID number: " + studentId);
        System.out.println("Name: " + firstName + " " + lastName);
        System.out.println("Age: " + age);
        System.out.println(firstName + " is a degree-seeking student enrolled in " + creditHours + " credits");
    }
    
    @Override
    public double computeFees() {
        // Base fee calculation for degree-seeking students
        double recreationFee = 100.0;
        double unionFee = 50.0;
        int billableHours = Math.min(creditHours, 12);
        double tuitionFee = billableHours * 275.0;
        return recreationFee + unionFee + tuitionFee;
    }
    
    protected String getMajorName(String majorCode) {
        switch (majorCode) {
            case "S": return "gaming science";
            case "M": return "hotel management";
            case "A": return "lounge arts";
            case "E": return "beverage engineering";
            default: return "unknown";
        }
    }
    
    protected String getStandingName(String standingCode) {
        switch (standingCode) {
            case "G": return "good";
            case "W": return "warning";
            case "P": return "probation";
            default: return "unknown";
        }
    }
}
