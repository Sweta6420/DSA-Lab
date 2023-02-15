class ITC{
	int n; boolean valueSet = false;
	synchronized int get(){
		if (valueSet==false) {
			try {wait();} 
			catch(InterruptedException e) {
				System.out.println("Interrupted Exception");
			}
		}
		System.out.println("Got: " + n);
		valueSet = false;
		notify();
		return n;
	}
	synchronized void put(int n){
		if (valueSet==true){
			try { wait();}
			catch (InterruptedException e){
				System.out.println("Interrupted Exception");
			}
		}
		this.n = n;
		valueSet = true;
		System.out.println("Put: " + n);
		notify();
	}
}
class Producer implements Runnable{
	Thread t; ITC q;
	Producer(ITC q){
		this.q = q;
		t = new Thread(this,"Producer");
		t.start();
	}
	public void run(){
		for (int i=1; i<=100; i++) {
			q.put(i);
		}
	}
}
class Consumer implements Runnable{
	Thread t; ITC q;
	Consumer(ITC q){
		this.q = q;
		t = new Thread(this,"Consumer");
		t.start();
	}
	public void run(){
		while(true) q.get();
	}
}
class Q3{
	public static void main(String args[]){
		ITC q = new ITC();
		new Producer(q);
		new Consumer(q);
	}
}