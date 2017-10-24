<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            
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
        <img class="style5" src="images/login-area.jpg" /><br />
        <table cellpadding="5" cellspacing="0" class="style1" width="350">
            <tr bgcolor="#C2ECEF">
                <td width="60">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" width="60">
                    帳號</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtUid" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUid" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="60">
                    密碼</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPwd" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Red" 
                        CausesValidation="False" onclick="LinkButton1_Click">忘記密碼?</asp:LinkButton>
                </td>
            </tr>
           
            
            
           
            <tr bgcolor="#C2ECEF">
                <td width="60">
                    &nbsp;</td>
                <td align="left" valign="middle">
    <asp:Button ID="btnMemberLogin" runat="server" Text="會員登入" 
        onclick="btnMemberLogin_Click" />
    <asp:Button ID="btnAdminLogin" runat="server" Text="管理者登入" 
        onclick="btnAdminLogin_Click" />
                </td>
            </tr>
        </table>
    </p>
<p>
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource_Member" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
        DataSourceMode="DataReader" 
        SelectCommand="SELECT [帳號], [密碼] FROM [會員] WHERE (([帳號] = @帳號) AND ([密碼] = @密碼))">
        <SelectParameters>
            <asp:Parameter Name="帳號" Type="String" />
            <asp:Parameter Name="密碼" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_Admin" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
        DataSourceMode="DataReader" 
        SelectCommand="SELECT * FROM [管理者] WHERE (([帳號] = @帳號) AND ([密碼] = @密碼))">
        <SelectParameters>
            <asp:Parameter Name="帳號" Type="String" />
            <asp:Parameter Name="密碼" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>

