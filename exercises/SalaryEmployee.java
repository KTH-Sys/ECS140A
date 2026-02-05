public class SalaryEmployee extends Employee {
    protected int monthlySalary;

    public SalaryEmployee(String name, int id, int monthlySalary){
        super(name, id);
        this.monthlySalary = monthlySalary;
    }

    @Override
    public int calculatePay() {
        return monthlySalary;
    }
}
    
