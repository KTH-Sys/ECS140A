public class HourlyEmployee extends Employee {
    protected int hoursWorked;
    protected int hourlyRate;

    public HourlyEmployee(String name, int id, int hoursWorked, int hourlyRate){
        super(name, id);
        this.hoursWorked = hoursWorked;
        this.hourlyRate = hourlyRate;
    }

    @Override
    public int calculatePay() {
        return hoursWorked * hourlyRate;
    }

}
