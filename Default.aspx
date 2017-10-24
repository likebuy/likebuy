<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 150px;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            color: #FF3300;
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
        <img class="style5" src="images/product-suggest.jpg" /><asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           <table class="style2">
                <tr>
                    <td>
                        請選擇產品類別：<asp:DropDownList ID="ddlProductClass" runat="server" 
                            AutoPostBack="True" DataSourceID="SqlDataSource_ProductClass" 
                            DataTextField="類別名稱" DataValueField="類別編號" 
                            onselectedindexchanged="ddlProductClass_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource_ProductClass" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                            SelectCommand="SELECT * FROM [產品類別] ORDER BY [類別編號] DESC">
                        </asp:SqlDataSource>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="False">
                            <ProgressTemplate>
                                <span class="style3">產品資料下載中...</span>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource_Product" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                SelectCommand="SELECT * FROM [產品資料] WHERE ([類別編號] = @類別編號) ORDER BY [編號] DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProductClass" Name="類別編號" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_ShoppingCar" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                DataSourceMode="DataReader" 
                DeleteCommand="DELETE FROM [購物車] WHERE [購物車編號] = @購物車編號" 
                InsertCommand="INSERT INTO [購物車] ([帳號], [產品編號], [品名], [單價], [數量]) VALUES (@帳號, @產品編號, @品名, @單價, @數量)" 
                SelectCommand="SELECT 購物車編號, 帳號, 產品編號, 品名, 單價, 數量 FROM 購物車 WHERE (帳號 = @帳號) AND (產品編號 = @產品編號)" 
                UpdateCommand="UPDATE [購物車] SET [數量] = 數量+1 WHERE 產品編號=@產品編號 AND 帳號=@帳號">
                <SelectParameters>
                    <asp:Parameter Name="帳號" />
                    <asp:Parameter Name="產品編號" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="購物車編號" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="帳號" Type="String" />
                    <asp:Parameter Name="產品編號" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="帳號" Type="String" />
                    <asp:Parameter Name="產品編號" Type="String" />
                    <asp:Parameter Name="品名" Type="String" />
                    <asp:Parameter Name="單價" Type="Int32" />
                    <asp:Parameter Name="數量" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblMsg" runat="server" ForeColor="Blue"></asp:Label>
            <br />
            <asp:DataList ID="DataList_Product" runat="server" CellPadding="5" 
                CellSpacing="1" DataKeyField="產品編號" DataSourceID="SqlDataSource_Product" 
                RepeatColumns="3" RepeatDirection="Horizontal" Width="95%" 
                onitemcommand="DataList_Product_ItemCommand" 
                onselectedindexchanged="DataList_Product_SelectedIndexChanged">
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td>
                                <asp:Image ID="ProductImg" runat="server" 
                                    ImageUrl='<%# Eval("圖示", "product_img/{0}") %>' Width="100px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="產品編號Label" runat="server" Text='<%# Eval("產品編號") %>' 
                                    Visible="False"></asp:Label>
                                <asp:Label ID="品名Label" runat="server" ForeColor="#0066FF" 
                                    Text='<%# Eval("品名") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                特價：<asp:Label ID="單價Label" runat="server" Font-Bold="True" Font-Names="Arial" 
                                    Font-Size="12pt" ForeColor="Red" Text='<%# Eval("單價") %>' />
                                &nbsp;<asp:Label ID="Label1" runat="server" Text="元/斤"></asp:Label>
&nbsp;<asp:LinkButton ID="btnBuy" runat="server" CommandName="Buy" Font-Overline="False" 
                                    Font-Underline="True" ForeColor="#33CC33" onclick="btnBuy_Click">購買
                                    </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
     
    <p>
    </p>
</asp:Content>

