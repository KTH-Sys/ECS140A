public class salarydriver {
    public static void main(String[] args) {
        Employee[] employees = new Employee[2];

        employees[0] = new HourlyEmployee("Alice", 101, 40, 30);
        employees[1] = new SalaryEmployee("Bob", 202, 3500);

        for (int i = 0; i < employees.length; i++) {
            employees[i].printInfo(employees[i].name, employees[i].id);
            System.out.printf("Pay: $%,d %n", employees[i].calculatePay());
            System.out.println();
        }

    
    }
}
