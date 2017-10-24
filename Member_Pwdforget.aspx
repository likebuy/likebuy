<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Member_Pwdforget.aspx.cs" Inherits="Member_Pwdforget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            width: 628px;
            height: 78px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img class="style8" src="images/password-forget.jpg" /><br />
    </p>
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
                    密碼提示</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtPwdforget" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPwdforget" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
           
            
            
           
            <tr bgcolor="#C2ECEF">
                <td width="60">
                    &nbsp;</td>
                <td align="left" valign="middle">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="確認" />
                </td>
            </tr>
        </table>
    <p>
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource_Member" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
            DataSourceMode="DataReader" 
            SelectCommand="SELECT [帳號], [密碼提示] FROM [會員] WHERE (([帳號] = @帳號) AND ([密碼提示] = @密碼提示))">
            <SelectParameters>
                <asp:Parameter Name="帳號" />
                <asp:Parameter Name="密碼提示" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

