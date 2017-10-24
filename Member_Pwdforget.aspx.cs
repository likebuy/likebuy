using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Member_Pwdforget : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource_Member.SelectParameters["帳號"].DefaultValue = txtUid.Text;
        SqlDataSource_Member.SelectParameters["密碼提示"].DefaultValue = txtPwdforget.Text;
        SqlDataReader dr = (SqlDataReader)SqlDataSource_Member.Select(DataSourceSelectArguments.Empty);
        if (dr.Read())
        {
            Session["IsMemberLogin"] = true;
            Session["MemberUid"] = dr["帳號"].ToString();
            Response.Redirect("Member_Update.aspx");
        }
        else
        {
            lblMsg.Text = "會員帳號與密碼提示錯誤!";
        }
        dr.Close();
    }
}