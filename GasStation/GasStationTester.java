public class GasStationTester
{
    public static void main (String[] args)
    {
        GasStation chevron = new GasStation();
        GasStation shell = new GasStation();
        System.out.println("Chevron has " + chevron.getAvailableGas());
        chevron.dispenseGas(); // 100 litres dispensed
        chevron.dispenseGas(); // 100 more litres dispensed
        System.out.println("Chevron has " + chevron.getAvailableGas());
        System.out.println("Shell has " + shell.getAvailableGas());
        shell.dispenseGas(); // 100 litres dispensed
        System.out.println("Shell has " + shell.getAvailableGas());
    }
}
