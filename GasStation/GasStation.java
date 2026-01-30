public class GasStation 
{
    public int availableGas;
    final public int START_AMOUNT = 10000;
    final public int DISPENSE_AMOUNT = 100;


    public GasStation()
    {
        availableGas = START_AMOUNT;
    }

    public void dispenseGas ()
    {
        if (availableGas >= DISPENSE_AMOUNT) 
        {
           availableGas = availableGas - DISPENSE_AMOUNT;
        }
    }

    public int getAvailableGas()
    {
        return availableGas;
    }
}
