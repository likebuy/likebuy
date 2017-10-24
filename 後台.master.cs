using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class 後台 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsAdminLogin"] == null)
        {
            Response.Redirect("Login.aspx");
        }


        SqlDataReader drMember = (SqlDataReader)SqlDataSource_ad.Select(DataSourceSelectArguments.Empty);
        if (drMember.Read())
        {
            lbladv.Text = "<MARQUEE>" + drMember["跑馬燈"].ToString() + "</MARQUEE>";
        }
        drMember.Close();
       
        
    }
        

    protected void btnAdminLogout_Click1(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
    protected void feedback_return_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_FeedbackSelect.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_FeedbackReturn.aspx");
    }
    
    protected void btnad_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_AD.aspx");
    }
}
