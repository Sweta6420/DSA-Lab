class RowSumT implements Runnable
{   
    int a[];
    int sum;
    Thread t;
    RowSumT(int a[],String threadName)
    {
        this.a = a;
        sum=0;
        t = new Thread(this,threadName);
        t.start();
    }
    public void run()
    {
        for (int i=0; i<a.length; i++) sum+=a[i];
    }
    int getSum()
    {
        return sum;
    }
}
public class Q2 
{
    public static void main(String args[])
    {   
        int mat[][] = {{1,2,3},{4,5,6},{7,8,9}};
        int sum =0;
        RowSumT tr[] = new RowSumT[mat.length];
        for (int i=0; i<tr.length; i++)
        {
            tr[i] = new RowSumT(mat[i],"Thread "+(i+1));
        }
        for (int i=0; i<tr.length; i++)
        {   
            try{
                tr[i].t.join();
            }
            catch(InterruptedException e) { System.out.print(e);}
        }
        for (int i=0; i<tr.length; i++)
        {
            sum+=tr[i].getSum();
            System.out.println(tr[i].t.getName()+": "+tr[i].getSum());
        }
        System.out.print("Sum: "+ sum);
    }
}
