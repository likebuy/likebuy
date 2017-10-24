using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Member_Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["IsMemberLogin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!Page.IsPostBack)
        {
            SqlDataReader drMember = (SqlDataReader)SqlDataSource_Member.Select(DataSourceSelectArguments.Empty);
            if (drMember.Read())
            {
                txtUid.Text = drMember["帳號"].ToString();
                
            }
            drMember.Close();
        }
    }
    protected void btnsent_Click(object sender, EventArgs e)
    {
        
        SqlDataSource_feedback.InsertParameters["帳號"].DefaultValue = txtUid.Text;
        SqlDataSource_feedback.InsertParameters["發問標題"].DefaultValue = txttitle.Text;
        SqlDataSource_feedback.InsertParameters["發問內容"].DefaultValue = txtfeedback.Text;
        SqlDataSource_feedback.InsertParameters["發問日期"].DefaultValue = DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss");
        SqlDataSource_feedback.Insert();
        
           
            Response.Redirect("Member_FeedbackSelect.aspx");
        
    }
    protected void txtUid_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txttime_TextChanged(object sender, EventArgs e)
    {
       
    }
}