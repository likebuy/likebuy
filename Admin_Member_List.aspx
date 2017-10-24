<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Member_List.aspx.cs" Inherits="Admin_Manager_Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 628px;
            height: 78px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img class="style5" src="images/member-manager.jpg" /><asp:ScriptManager 
            ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource 
            ID="SqlDataSource_Member" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
            SelectCommand="SELECT * FROM 會員"></asp:SqlDataSource>
            <asp:GridView ID="GridView_Member" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="帳號" DataSourceID="SqlDataSource_Member" ForeColor="#333333" 
            GridLines="None" Width="100%">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="帳號" HeaderText="帳號" ReadOnly="True" 
                    SortExpression="帳號" />
                    <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                    <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                    <asp:BoundField DataField="信箱" HeaderText="信箱" SortExpression="信箱" />
                    <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                    <asp:BoundField DataField="住址" HeaderText="住址" SortExpression="住址" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <br />
    </p>
    <br />
</asp:Content>

