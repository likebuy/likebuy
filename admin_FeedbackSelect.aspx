<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="admin_FeedbackSelect.aspx.cs" Inherits="客服回報" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            width: 628px;
            height: 78px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img class="style7" src="images/admin-feedback.jpg" /><br />
    </p>
    <p>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <p>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource_feedback" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                SelectCommand="SELECT * FROM [發問] WHERE [回覆內容] IS NULL ORDER BY 發問編號 DESC  " 
                UpdateCommand="UPDATE [發問] SET [回覆內容] = @回覆內容 WHERE[發問編號] = @發問編號">
                <UpdateParameters>
                    <asp:Parameter Name="回覆內容" />
                    <asp:Parameter Name="發問編號" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="發問編號" DataSourceID="SqlDataSource_feedback" ForeColor="#333333" 
                GridLines="None" PageSize="5" Width="100%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" 
                        ShowSelectButton="True" />
                    <asp:BoundField DataField="帳號" HeaderText="帳號" ReadOnly="True" 
                        SortExpression="帳號" />
                    <asp:BoundField DataField="發問編號" HeaderText="發問編號" InsertVisible="False" 
                        ReadOnly="True" SortExpression="發問編號" />
                    <asp:BoundField DataField="發問標題" HeaderText="發問標題" ReadOnly="True" 
                        SortExpression="發問標題" />
                    <asp:BoundField DataField="發問內容" HeaderText="發問內容" ReadOnly="True" 
                        SortExpression="發問內容" />
                    <asp:TemplateField HeaderText="發問日期" SortExpression="發問日期">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("發問日期", "{0:d}") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("發問日期", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="回覆內容" SortExpression="回覆內容">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Height="100px" 
                                Text='<%# Bind("回覆內容") %>' Width="200px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("回覆內容") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
    <br />
</p>
    <p>
        &nbsp;</p>
    </asp:Content>

