/**
 * Class representing certificate students
 */
public class CertificateStudent extends NonDegreeSeekingStudent {
    private String certificateType;
    
    public CertificateStudent(String studentId, String firstName, String lastName,
                             int age, int creditHours, String certificateType) {
        super(studentId, firstName, lastName, age, creditHours);
        this.certificateType = certificateType;
    }
    
    @Override
    public void printData() {
        super.printData();
        System.out.println(firstName + " is a certificate student enrolled in " + creditHours + " credits");
        System.out.println(firstName + " is pursuing a certificate in " + getCertificateName(certificateType) + ".");
    }
    
    @Override
    public double computeFees() {
        return 700.0 + (creditHours * 300.0);
    }
    
    private String getCertificateName(String certCode) {
        switch (certCode) {
            case "S": return "gaming science";
            case "M": return "hotel management";
            case "A": return "lounge arts";
            case "E": return "beverage engineering";
            default: return "unknown";
        }
    }
}
