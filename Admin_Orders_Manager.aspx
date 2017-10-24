<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Orders_Manager.aspx.cs" Inherits="Admin_Orders_Manager" %>

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
        <img class="style7" src="images/order-manager.jpg" /><asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p>
                <asp:SqlDataSource ID="SqlDataSource_Order" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
            
            SelectCommand="SELECT * FROM [訂單主檔] ORDER BY 訂單編號 DESC" 
                    DeleteCommand="DELETE FROM [訂單主檔] WHERE [訂單編號] = @訂單編號" 
                    UpdateCommand="UPDATE [訂單主檔] SET [訂單狀態] = @訂單狀態 WHERE [訂單編號] = @訂單編號">
                    <DeleteParameters>
                        <asp:Parameter Name="訂單編號" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="訂單狀態" Type="String" />
                        <asp:Parameter Name="訂單編號" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView_Order" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="訂單編號" DataSourceID="SqlDataSource_Order" ForeColor="#333333" 
            GridLines="None" PageSize="5" Width="100%">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField ButtonType="Button" 
                            ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="訂單編號" HeaderText="訂單編號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="訂單編號" />
                        <asp:BoundField DataField="收貨人" HeaderText="收貨人" SortExpression="收貨人" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="收貨人電話" HeaderText="收貨人電話" SortExpression="收貨人電話" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="收貨人住址" HeaderText="收貨人住址" SortExpression="收貨人住址" 
                            ReadOnly="True" />
                        <asp:TemplateField HeaderText="訂單狀態" SortExpression="訂單狀態">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("訂單狀態") %>' 
                                    Width="70px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("訂單狀態") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="下單日期" HeaderText="下單日期" SortExpression="下單日期" 
                            DataFormatString="{0:d}" ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </p>
            <p>
                <asp:SqlDataSource ID="SqlDataSource_OrderDetail" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
            
            
                    SelectCommand="SELECT 訂單明細.產品編號, 產品資料.品名, 訂單明細.單價, 訂單明細.數量, 訂單明細.單價 * 訂單明細.數量 AS 小計 FROM 訂單明細 INNER JOIN 產品資料 ON 訂單明細.產品編號 = 產品資料.產品編號 WHERE (訂單明細.訂單編號 = @訂單編號)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView_Order" Name="訂單編號" 
                    PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView_OrderDetail" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSource_OrderDetail" GridLines="Horizontal" 
            Width="100%">
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="產品編號" HeaderText="產品編號" SortExpression="產品編號" />
                        <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
                        <asp:BoundField DataField="單價" HeaderText="單價" SortExpression="單價" />
                        <asp:BoundField DataField="數量" HeaderText="數量" SortExpression="數量" />
                        <asp:BoundField DataField="小計" HeaderText="小計" ReadOnly="True" 
                    SortExpression="小計" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <br />
            </p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <br />
    </p>
</asp:Content>

