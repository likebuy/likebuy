<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Member_Feedback.aspx.cs" Inherits="Member_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style10
    {
        }
    .style11
    {
        height: 35px;
        width: 134px;
    }
    .style12
    {
        height: 35px;
    }
        .style13
        {
            width: 628px;
            height: 78px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img class="style13" src="images/member-feedback.jpg" /><br />
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource_feedback" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
        DataSourceMode="DataReader" 
        DeleteCommand="DELETE FROM [發問] WHERE [發問編號] = @發問編號" 
        InsertCommand="INSERT INTO [發問] ([發問標題], [發問內容], [帳號], [發問日期]) VALUES (@發問標題, @發問內容,  @帳號, @發問日期 ) " 
        SelectCommand="SELECT * FROM [發問]" 
        
        
        UpdateCommand="UPDATE [發問] SET [發問標題] = @發問標題, [發問內容] = @發問內容, [發問日期] = @發問日期, [帳號] = @帳號, [處理進度] = @處理進度 WHERE [發問編號] = @發問編號">
        <DeleteParameters>
            <asp:Parameter Name="發問編號" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="發問標題" Type="String" />
            <asp:Parameter Name="發問內容" Type="String" />
            <asp:Parameter Name="帳號" Type="String" />
            <asp:Parameter Name="發問日期" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="發問標題" Type="String" />
            <asp:Parameter Name="發問內容" Type="String" />
            <asp:Parameter Name="發問日期" Type="DateTime" />
            <asp:Parameter Name="帳號" Type="String" />
            <asp:Parameter Name="處理進度" Type="String" />
            <asp:Parameter Name="發問編號" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_Member" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
        DataSourceMode="DataReader" SelectCommand="SELECT 帳號 FROM 會員 WHERE (帳號 = @帳號)">
        <SelectParameters>
            <asp:SessionParameter Name="帳號" SessionField="MemberUid" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<table class="style4" style="height: 247px; width: 84%">
    <tr>
        <td class="style11" bgcolor="#CCFFFF">
            帳號</td>
        <td class="style12">
            <asp:TextBox ID="txtUid" runat="server" ontextchanged="txtUid_TextChanged" 
                ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style11" bgcolor="#CCFFFF">
            發問標題</td>
        <td class="style12">
            <asp:TextBox ID="txttitle" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txttitle" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style10" bgcolor="#CCFFFF">
            發問內容</td>
        <td>
            <asp:TextBox ID="txtfeedback" runat="server" Height="150px" Width="356px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtfeedback" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style10" bgcolor="#CCFFFF">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnsent" runat="server" onclick="btnsent_Click" Text="送出" />
        </td>
    </tr>
</table>
<p>
    <asp:TextBox ID="txttime" runat="server" ontextchanged="txttime_TextChanged" 
        Visible="False"></asp:TextBox>
    </p>
</asp:Content>

