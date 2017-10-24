using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class 前台 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsMemberLogin"] == null)
        {
           
            PanelMemberLogout.Visible = true ;
            
            PanelMemberLogin.Visible = false;
        }
        else
        {
          
            PanelMemberLogout.Visible = false;
        
            PanelMemberLogin.Visible = true;
        }
        SqlDataReader drMember = (SqlDataReader)SqlDataSource_ad.Select(DataSourceSelectArguments.Empty);
        if (drMember.Read())
        {
            lbladv.Text = "<MARQUEE>" + drMember["跑馬燈"].ToString() + "</MARQUEE>";
        }
        drMember.Close();



    }
    protected void btnMemberLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
    protected void Member_feedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Member_Feedback.aspx");
    }
    protected void Member_FeedbackSelect_Click(object sender, EventArgs e)
    {
        Response.Redirect("Member_FeedbackSelect.aspx");
    }
}
