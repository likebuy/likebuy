using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnMemberAdd_Click(object sender, EventArgs e)
    {
       
        try
        {
            
            SqlDataSource_Member.InsertParameters["帳號"].DefaultValue = txtUid.Text;
            SqlDataSource_Member.InsertParameters["密碼"].DefaultValue = txtPwd .Text ;
            SqlDataSource_Member.InsertParameters["密碼提示"].DefaultValue = txtPwdforget.Text;
            SqlDataSource_Member.InsertParameters["姓名"].DefaultValue = txtName .Text ;
            SqlDataSource_Member.InsertParameters["信箱"].DefaultValue = txtMail .Text ;
            SqlDataSource_Member.InsertParameters["電話"].DefaultValue = txtTel.Text ;
            SqlDataSource_Member.InsertParameters["住址"].DefaultValue = txtAdd .Text ;
            SqlDataSource_Member.Insert();
            Response.Redirect("Member_Add_Ok.htm");
        }
        catch (Exception ex)
        {
            lblMsg.Text = "此帳號有人使用!";
           

        }
    }
    protected void txtUid_TextChanged(object sender, EventArgs e)
    {

        
    }
    protected void txtUid_TextChanged1(object sender, EventArgs e)
    {

    }
}
