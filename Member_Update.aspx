<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Member_Update.aspx.cs" Inherits="Member_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 100%;
            background-color: #E3EAEB;
        }
        .style5
        {
            width: 628px;
            height: 78px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img class="style5" src="images/member-update.jpg" /><asp:SqlDataSource 
            ID="SqlDataSource_Member" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
            
            InsertCommand="INSERT INTO [會員] ([帳號], [密碼], [姓名], [信箱], [電話], [住址]) VALUES (@帳號, @密碼, @姓名, @信箱, @電話, @住址)" 
            SelectCommand="SELECT 帳號, 密碼, 姓名, 信箱, 電話, 住址 FROM 會員 WHERE (帳號 = @帳號)" 
            DataSourceMode="DataReader" 
            UpdateCommand="UPDATE 會員 SET 密碼 = @密碼, 姓名 = @姓名, 信箱 = @信箱, 電話 = @電話, 住址 = @住址 WHERE (帳號 = @帳號)">
            <SelectParameters>
                <asp:SessionParameter Name="帳號" SessionField="MemberUid" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="密碼" />
                <asp:Parameter Name="姓名" />
                <asp:Parameter Name="信箱" />
                <asp:Parameter Name="電話" />
                <asp:Parameter Name="住址" />
                <asp:Parameter Name="帳號" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="帳號" Type="String" />
                <asp:Parameter Name="密碼" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="信箱" Type="String" />
                <asp:Parameter Name="電話" Type="String" />
                <asp:Parameter Name="住址" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <table cellpadding="5" cellspacing="0" class="style1">
            <tr bgcolor="#C2ECEF">
                <td width="100">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" width="100">
                    帳號</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtUid" runat="server" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUid" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    密碼</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPwd" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    姓名</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    信箱</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtMail" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    電話</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtTel" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    住址</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtAdd" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtAdd" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
             
            <tr bgcolor="#C2ECEF">
                <td width="100">
                    &nbsp;</td>
                <td align="left" valign="middle">
                    <asp:Button ID="btnMemberUpdate" runat="server" onclick="btnMemberUpdate_Click" 
                        Text="會員資料修改" />
                </td>
            </tr>
        </table>
    </p>
    <p>
        <br />
    </p>
</asp:Content>

