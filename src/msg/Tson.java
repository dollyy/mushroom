package msg;

import java.io.Serializable;

public class Tson implements Serializable
{
	/**
	 * 
	 */
	public Tson(){
		
	}
	
	
	public Tson(int s_id, String s_name, int f_id, String s_img)
	{
		super();
		this.s_id = s_id;
		this.s_name = s_name;
		this.f_id = f_id;
		this.s_img = s_img;
	}


	private int s_id;
	private String s_name;
	private int f_id;
	private String s_img;
	public String getS_img()
	{
		return s_img;
	}

	public void setS_img(String s_img)
	{
		this.s_img = s_img;
	}

	public int getS_id()
	{
		return s_id;
	}
	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}
	public String getS_name()
	{
		return s_name;
	}
	public void setS_name(String s_name)
	{
		this.s_name = s_name;
	}
	public int getF_id()
	{
		return f_id;
	}
	public void setF_id(int f_id)
	{
		this.f_id = f_id;
	}
	
}
