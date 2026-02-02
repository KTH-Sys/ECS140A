import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;

public class Report{
    public static String generateReport() {
        //TODO process input data
            //your code goes here..
        Student[] students = new Student[100];
        int studentCount = 0;
        
        // Read student data from hw2.txt
        try (BufferedReader reader = new BufferedReader(new FileReader("hw2.txt"))) {
            String line;
            while ((line = reader.readLine()) != null && studentCount < 100) {
                Student student = parseStudent(line);
                if (student != null) {
                    students[studentCount++] = student;
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
        }

        //TODO call printData()
            //your code goes here..
        for (int i = 0; i < studentCount; i++) {
            students[i].printData();
            System.out.println();
        }

        //----------DONT EDIT BELOW THIS LINE-----------
        //custom stream for report
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        PrintStream old = System.out;
        System.setOut(ps);
        //----------DONT EDIT ABOVE THIS LINE-----------
        
        
        //TODO generate report 1 
            //your code goes here..
        System.out.println("Summary of each student's fees assessed: ");
        System.out.println();
        for (int i = 0; i < studentCount; i++) {
            Student s = students[i];
            double fees = s.computeFees();
            System.out.printf("%s %s has $%,.0f fees assessed %n",
                            s.getFirstName(), s.getLastName(), fees);
        }
        System.out.println();

        //TODO generate report 2
            //your code goes here..
        double noAidTotal = 0.0;
        double withAidTotal = 0.0;
        double certificateTotal = 0.0;
        double seniorTotal = 0.0;
        
        for (int i = 0; i < studentCount; i++) {
            Student s = students[i];
            double fees = s.computeFees();
            
            if (s instanceof DegreeSeekingStudentWithAid) {
                withAidTotal += fees;
            } else if (s instanceof DegreeSeekingStudentNoAid) {
                noAidTotal += fees;
            } else if (s instanceof CertificateStudent) {
                certificateTotal += fees;
            } else if (s instanceof SeniorCitizen) {
                seniorTotal += fees;
            }
        }
        
        double grandTotal = noAidTotal + withAidTotal + certificateTotal + seniorTotal;
        
        System.out.println("Summary of all student fees assessed: ");
        System.out.println();
        System.out.printf("Degree-seeking students without financial assistance: $%,.0f%n", noAidTotal);
        System.out.printf("Degree-seeking students with financial assistance: $%,.0f%n", withAidTotal);
        System.out.printf("Certificate students: $%,.0f%n", certificateTotal);
        System.out.printf("Senior citizens: $%,.0f%n", seniorTotal);
        System.out.println();
        System.out.printf("Total fees assessed: $%,.0f%n", grandTotal);

        //----------DONT EDIT BELOW THIS LINE-----------
        //reset stream
        System.out.flush();
        System.setOut(old);
        return baos.toString();
    }
    
    /**
     * Parse a line from the file and create the appropriate Student object
     */
    private static Student parseStudent(String line) {
        String[] parts = line.split(";");
        
        String studentId = parts[0];
        String firstName = parts[1];
        String lastName = parts[2];
        int age = Integer.parseInt(parts[3]);
        int creditHours = Integer.parseInt(parts[4]);
        String degreeSeekingFlag = parts[5];
        
        if (degreeSeekingFlag.equals("Y")) {
            // Degree-seeking student
            String major = parts[6];
            String standing = parts[7];
            String hasAid = parts[8];
            
            if (hasAid.equals("Y")) {
                double aid = Double.parseDouble(parts[9]);
                return new DegreeSeekingStudentWithAid(studentId, firstName, lastName,
                                                       age, creditHours, major, standing, aid);
            } else {
                return new DegreeSeekingStudentNoAid(studentId, firstName, lastName,
                                                     age, creditHours, major, standing);
            }
        } else {
            // Non-degree-seeking student
            String studentType = parts[6];
            
            if (studentType.equals("C")) {
                // Certificate student
                String certType = parts[7];
                return new CertificateStudent(studentId, firstName, lastName,
                                             age, creditHours, certType);
            } else if (studentType.equals("S")) {
                // Senior citizen
                return new SeniorCitizen(studentId, firstName, lastName,
                                        age, creditHours);
            }
        }
        
        return null;
    }
}
