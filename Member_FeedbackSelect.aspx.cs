using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Member_feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsMemberLogin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }




    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        
    }


    protected void txtreturn_TextChanged(object sender, EventArgs e)
    {

    }
}