package msg;

public class Tadds
{
	public Tadds(){}
	
	public Tadds(String username, String recname, String rectel, String add)
	{
		super();
		this.username = username;
		this.recname = recname;
		this.rectel = rectel;
		this.add = add;
	}
	private String username;
	private String recname;
	private String rectel;
	private String add;
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getRecname()
	{
		return recname;
	}
	public void setRecname(String recname)
	{
		this.recname = recname;
	}
	public String getRectel()
	{
		return rectel;
	}
	public void setRectel(String rectel)
	{
		this.rectel = rectel;
	}
	public String getAdd()
	{
		return add;
	}
	public void setAdd(String add)
	{
		this.add = add;
	}
	
}
