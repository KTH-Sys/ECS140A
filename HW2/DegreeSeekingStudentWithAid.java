/**
 * Class representing degree-seeking students with financial assistance
 */
public class DegreeSeekingStudentWithAid extends DegreeSeekingStudent {
    private double financialAid;
    
    public DegreeSeekingStudentWithAid(String studentId, String firstName, String lastName,
                                       int age, int creditHours, String major, String academicStanding,
                                       double financialAid) {
        super(studentId, firstName, lastName, age, creditHours, major, academicStanding);
        this.financialAid = financialAid;
    }
    
    @Override
    public void printData() {
        super.printData();
        System.out.printf("%s receives $%.2f in financial assistance per term%n", firstName, financialAid);
        System.out.println(firstName + "'s major is " + getMajorName(major));
        System.out.println(firstName + "'s academic standing is " + getStandingName(academicStanding) + ".");
    }
    
    @Override
    public double computeFees() {
        double baseFees = super.computeFees();
        double netFees = baseFees - financialAid;
        return Math.max(0.0, netFees);
    }
    
    public double getFinancialAid() {
        return financialAid;
    }
}
