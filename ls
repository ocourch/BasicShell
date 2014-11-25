import java.io.File;
import java.util.concurrent.LinkedBlockingQueue;


public class ls extends Filter implements Runnable {
	private File wd = new File(MyShell.myPath.toString());
	private File[] fls = wd.listFiles();
	
	public ls (LinkedBlockingQueue<Object> in, LinkedBlockingQueue<Object> out){
		super(in, out);
	}
	public void run() {
        for(File f : fls){
        	try {
				out.put(f);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
        }
        try {
			out.put("&&&");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
        this.done=true;
     }

	@Override
	public Object transform(Object o) {
		// TODO Auto-generated method stub
		return null;
	}
}
