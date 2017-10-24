<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Member_Add.aspx.cs" Inherits="Member_Add" %>

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
        .style8
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img class="style5" src="images/add-member.jpg" /><asp:SqlDataSource 
            ID="SqlDataSource_Member" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
            SelectCommand="SELECT * FROM [會員]" 
            DeleteCommand="DELETE FROM [會員] WHERE [帳號] = @帳號" 
            InsertCommand="INSERT INTO [會員] ([帳號], [密碼], [密碼提示], [姓名], [信箱], [電話], [住址]) VALUES (@帳號, @密碼, @密碼提示, @姓名, @信箱, @電話, @住址)" 
            UpdateCommand="UPDATE [會員] SET [密碼] = @密碼, [密碼提示] = @密碼提示, [姓名] = @姓名, [信箱] = @信箱, [電話] = @電話, [住址] = @住址 WHERE [帳號] = @帳號">
            <DeleteParameters>
                <asp:Parameter Name="帳號" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="帳號" Type="String" />
                <asp:Parameter Name="密碼" Type="String" />
                <asp:Parameter Name="密碼提示" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="信箱" Type="String" />
                <asp:Parameter Name="電話" Type="String" />
                <asp:Parameter Name="住址" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="密碼" Type="String" />
                <asp:Parameter Name="密碼提示" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="信箱" Type="String" />
                <asp:Parameter Name="電話" Type="String" />
                <asp:Parameter Name="住址" Type="String" />
                <asp:Parameter Name="帳號" Type="String" />
            </UpdateParameters>
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
                    <asp:TextBox ID="txtUid" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUid" ErrorMessage="*"></asp:RequiredFieldValidator>
                        
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtUid"
                     runat="server" 
                        ErrorMessage="只能填入數字或英文" ValidationExpression="^[A-Za-z0-9]+$"></asp:RegularExpressionValidator>
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
                <td align="right" width="100" class="style8">
                    密碼提示</td>
                <td align="left" bgcolor="White" class="style8">
                    <asp:TextBox ID="txtPwdforget" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtPwdforget" ErrorMessage="*"></asp:RequiredFieldValidator>
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
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="請輸入正確信箱" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
                    <asp:Button ID="btnMemberAdd" runat="server" onclick="btnMemberAdd_Click" 
                        Text="會員註冊" />
                </td>
            </tr>
        </table>
    </p>
    <p>
        <br />
    </p>
</asp:Content>

