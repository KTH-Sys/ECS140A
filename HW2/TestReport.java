/**
 * Simple test harness for Report.java
 * This demonstrates how Gradescope might test your submission
 */
public class TestReport {
    public static void main(String[] args) {
        System.out.println("Testing Report.generateReport()...");
        System.out.println("=====================================");
        System.out.println();
        
        String output = Report.generateReport();
        System.out.println(output);
        
        System.out.println("=====================================");
        System.out.println("Test completed!");
    }
}
