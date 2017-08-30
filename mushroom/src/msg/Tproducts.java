package msg;

public class Tproducts
{
	public Tproducts(){
		
	}
	
	public Tproducts(int g_id, String g_name, int s_id, String g_img,
			String g_price, int g_sales)
	{
		super();
		this.g_id = g_id;
		this.g_name = g_name;
		this.s_id = s_id;
		this.g_img = g_img;
		this.g_price = g_price;
		this.g_sales = g_sales;
	}
	private int g_id;
	private String g_name;
	private int s_id;
	private String g_img;
	private String g_price;
	private int g_sales;
	public int getG_id()
	{
		return g_id;
	}
	public void setG_id(int g_id)
	{
		this.g_id = g_id;
	}
	public String getG_name()
	{
		return g_name;
	}
	public void setG_name(String g_name)
	{
		this.g_name = g_name;
	}
	public int getS_id()
	{
		return s_id;
	}
	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}
	public String getG_img()
	{
		return g_img;
	}
	public void setG_img(String g_img)
	{
		this.g_img = g_img;
	}
	public String getG_price()
	{
		return g_price;
	}
	public void setG_price(String g_price)
	{
		this.g_price = g_price;
	}
	public int getG_sales()
	{
		return g_sales;
	}
	public void setG_sales(int g_sales)
	{
		this.g_sales = g_sales;
	}
	
}
