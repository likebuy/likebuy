<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Member_ShoppingCar.aspx.cs" Inherits="Member_ShoppingCar" %>

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
    <img class="style5" src="images/shoppingcar.jpg" /><asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource_ShoppingCar" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
    DeleteCommand="DELETE FROM [購物車] WHERE [購物車編號] = @購物車編號" 
    InsertCommand="INSERT INTO [購物車] ([帳號], [產品編號], [品名], [單價], [數量]) VALUES (@帳號, @產品編號, @品名, @單價, @數量)" 
    SelectCommand="SELECT * FROM [購物車] WHERE ([帳號] = @帳號)" 
    UpdateCommand="UPDATE [購物車] SET  [數量] = @數量 WHERE [購物車編號] = @購物車編號" 
                DataSourceMode="DataReader">
                <SelectParameters>
                    <asp:SessionParameter Name="帳號" SessionField="MemberUid" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="購物車編號" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="帳號" Type="String" />
                    <asp:Parameter Name="產品編號" Type="String" />
                    <asp:Parameter Name="品名" Type="String" />
                    <asp:Parameter Name="單價" Type="Int32" />
                    <asp:Parameter Name="數量" Type="Int32" />
                    <asp:Parameter Name="購物車編號" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="帳號" Type="String" />
                    <asp:Parameter Name="產品編號" Type="String" />
                    <asp:Parameter Name="品名" Type="String" />
                    <asp:Parameter Name="單價" Type="Int32" />
                    <asp:Parameter Name="數量" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_Member" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                DataSourceMode="DataReader" 
                SelectCommand="SELECT  姓名, 電話, 住址 FROM 會員 WHERE (帳號 = @帳號)">
                <SelectParameters>
                    <asp:SessionParameter Name="帳號" SessionField="MemberUid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView_ShoppingCar" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
    CellPadding="4" DataKeyNames="購物車編號" DataSourceID="SqlDataSource_ShoppingCar" 
    ForeColor="#333333" GridLines="None" Width="85%">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:CommandField ButtonType="Button" 
            ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False">
                    </asp:CommandField>
                    <asp:BoundField DataField="產品編號" HeaderText="產品編號" 
            ReadOnly="True" SortExpression="產品編號">
                    <ItemStyle Width="90px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="品名" HeaderText="品名" 
            ReadOnly="True" SortExpression="品名" />
                    <asp:BoundField DataField="單價" HeaderText="單價" 
            ReadOnly="True" SortExpression="單價">
                    <ItemStyle Width="80px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="數量" SortExpression="數量">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                    Text='<%# Bind("數量") %>' Width="50px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                    Text='<%# Bind("數量") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" 
        ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" 
        HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" 
        ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" 
        ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" 
        ForeColor="#284775" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource_Order" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                DataSourceMode="DataReader" 
                InsertCommand="INSERT INTO 訂單主檔(帳號, 收貨人, 收貨人電話, 收貨人住址, 下單日期, 訂單狀態) VALUES (@帳號, @收貨人, @收貨人電話, @收貨人住址, @下單日期, @訂單狀態)" 
                SelectCommand="SELECT TOP (1) 訂單編號 FROM 訂單主檔 ORDER BY 訂單編號 DESC">
                <InsertParameters>
                    <asp:Parameter Name="帳號" />
                    <asp:Parameter Name="收貨人" />
                    <asp:Parameter Name="收貨人電話" />
                    <asp:Parameter Name="收貨人住址" />
                    <asp:Parameter Name="下單日期" />
                    <asp:Parameter Name="訂單狀態" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_OrderDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                InsertCommand="INSERT INTO 訂單明細(訂單編號, 產品編號, 單價, 數量) VALUES (@訂單編號, @產品編號, @單價, @數量)" 
                SelectCommand="SELECT 訂單明細.* FROM 訂單明細">
                <InsertParameters>
                    <asp:Parameter Name="訂單編號" />
                    <asp:Parameter Name="產品編號" />
                    <asp:Parameter Name="單價" />
                    <asp:Parameter Name="數量" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_ShoppingDelAll" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                DeleteCommand="DELETE FROM 購物車 WHERE (帳號 = @帳號)" 
                SelectCommand="SELECT * FROM 購物車">
                <DeleteParameters>
                    <asp:Parameter Name="帳號" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <table cellpadding="5" cellspacing="0" class="style1">
                <tr bgcolor="#C2ECEF">
                    <td width="100">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" width="100">
                        收貨人<br /> </td>
                    <td align="left" bgcolor="White">
                        <asp:TextBox ID="txtReceiverName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtReceiverName" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtUid" runat="server" Visible="False"></asp:TextBox>
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                            oncheckedchanged="CheckBox1_CheckedChanged1" Text="同會員資料" />
                    </td>
                </tr>
                <tr>
                    <td align="right" width="100">
                        收貨人電話</td>
                    <td align="left" bgcolor="White">
                        <asp:TextBox ID="txtReceiverTel" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtReceiverTel" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="100">
                        收貨人住址</td>
                    <td align="left" bgcolor="White">
                        <asp:TextBox ID="txtReceiverAdd" runat="server" Width="300px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtReceiverAdd" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr bgcolor="#C2ECEF">
                    <td width="100">
                        &nbsp;</td>
                    <td align="left" valign="middle">
                        <asp:Button ID="btnOrderOk" runat="server" onclick="btnOrderOk_Click" 
                            Text="確定購買" />
                    </td>
                </tr>
            </table>
            &nbsp;<br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <br />
    </p>
</asp:Content>

