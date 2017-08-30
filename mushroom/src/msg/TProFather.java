package msg;

import java.io.Serializable;

public class TProFather implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3958057507878465854L;
	public TProFather(){
		
	}
	
	public TProFather(int f_id, String f_name)
	{
		super();
		this.f_id = f_id;
		this.f_name = f_name;
	}
	private int f_id;
	private String f_name;
	public int getF_id()
	{
		return f_id;
	}
	public void setF_id(int f_id)
	{
		this.f_id = f_id;
	}
	public String getF_name()
	{
		return f_name;
	}
	public void setF_name(String f_name)
	{
		this.f_name = f_name;
	}
	
}
