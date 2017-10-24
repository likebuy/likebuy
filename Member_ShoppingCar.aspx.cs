using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Member_ShoppingCar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (Session["MemberUid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
       

        else
        {
            txtUid.Text = Session["MemberUid"].ToString();
        }
        }
        
    }
    protected void btnOrderOk_Click(object sender, EventArgs e)
    {

            SqlDataReader dr = (SqlDataReader)SqlDataSource_ShoppingCar.Select(DataSourceSelectArguments.Empty);

            if (!dr.Read())
            {
                lblMsg.Text = "未選購產品，所以無法傳送訂單!";
                return;
            }

            dr.Close();


            SqlDataSource_Order.InsertParameters["帳號"].DefaultValue = txtUid.Text;
            SqlDataSource_Order.InsertParameters["收貨人"].DefaultValue = txtReceiverName.Text;
            SqlDataSource_Order.InsertParameters["收貨人電話"].DefaultValue = txtReceiverTel.Text;
            SqlDataSource_Order.InsertParameters["收貨人住址"].DefaultValue = txtReceiverAdd.Text;
            SqlDataSource_Order.InsertParameters["下單日期"].DefaultValue = DateTime.Now.ToShortDateString ();
            SqlDataSource_Order.InsertParameters["訂單狀態"].DefaultValue = "未處理";
            SqlDataSource_Order.Insert();

            int orderId = 1;
            SqlDataReader drOrder = (SqlDataReader)SqlDataSource_Order.Select(DataSourceSelectArguments.Empty);
            if (drOrder.Read())
            {
                orderId = int.Parse(drOrder["訂單編號"].ToString());
            }


            try
            {
                SqlDataReader drShopping = (SqlDataReader)SqlDataSource_ShoppingCar.Select(DataSourceSelectArguments.Empty);
                while (drShopping.Read())
                {
                    SqlDataSource_OrderDetail.InsertParameters["訂單編號"].DefaultValue = orderId.ToString();
                    SqlDataSource_OrderDetail.InsertParameters["產品編號"].DefaultValue = drShopping["產品編號"].ToString();
                    SqlDataSource_OrderDetail.InsertParameters["單價"].DefaultValue = drShopping["單價"].ToString();
                    SqlDataSource_OrderDetail.InsertParameters["數量"].DefaultValue = drShopping["數量"].ToString();
                    SqlDataSource_OrderDetail.Insert();
                }

                SqlDataSource_ShoppingDelAll.DeleteParameters["帳號"].DefaultValue = txtUid.Text;
                SqlDataSource_ShoppingDelAll.Delete();

                Response.Redirect("Member_ShoppingOk.htm");
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        


    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
      
        
            

        }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
            SqlDataReader drMember = (SqlDataReader)SqlDataSource_Member.Select(DataSourceSelectArguments.Empty);
            if (drMember.Read())
            {
                txtReceiverName.Text = drMember["姓名"].ToString();
                txtReceiverTel.Text = drMember["電話"].ToString();
                txtReceiverAdd.Text = drMember["住址"].ToString();
            }
            drMember.Close();
        
    }
    protected void CheckBox1_CheckedChanged1(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            SqlDataReader drMember = (SqlDataReader)SqlDataSource_Member.Select(DataSourceSelectArguments.Empty);
            if (drMember.Read())
            {
                txtReceiverName.Text = drMember["姓名"].ToString();
                txtReceiverTel.Text = drMember["電話"].ToString();
                txtReceiverAdd.Text = drMember["住址"].ToString();
            }
            drMember.Close();
        }
        else
        {
            txtReceiverName.Text = "".ToString();
            txtReceiverTel.Text = "".ToString();
            txtReceiverAdd.Text = "".ToString();
        }
    }
}
