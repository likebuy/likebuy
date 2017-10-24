<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Product_Edit.aspx.cs" Inherits="Admin_Product_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style2
        {
            width: 100%;
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
        <img class="style5" src="images/edit-product.jpg" /><asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="style2">
                <tr>
                    <td>
                        請選擇產品類別：<asp:DropDownList ID="ddlProductClass" runat="server" 
                            AutoPostBack="True" DataSourceID="SqlDataSource_ProductClass" 
                            DataTextField="類別名稱" DataValueField="類別編號">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource_ProductClass" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                            SelectCommand="SELECT * FROM [產品類別] ORDER BY [類別編號] DESC">
                        </asp:SqlDataSource>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource_Product" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                
                SelectCommand="SELECT [類別編號], [產品編號], [品名], [單價], [圖示] FROM [產品資料] WHERE ([類別編號] = @類別編號)" 
                DeleteCommand="DELETE FROM [產品資料] WHERE [產品編號] = @產品編號" 
                InsertCommand="INSERT INTO [產品資料] ([類別編號], [產品編號], [品名], [單價], [圖示]) VALUES (@類別編號, @產品編號, @品名, @單價, @圖示)" 
                
                UpdateCommand="UPDATE [產品資料] SET [類別編號] = @類別編號, [品名] = @品名, [單價] = @單價 WHERE [產品編號] = @產品編號">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProductClass" Name="類別編號" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="產品編號" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="類別編號" Type="Int32" />
                    <asp:Parameter Name="品名" Type="String" />
                    <asp:Parameter Name="單價" Type="Int32" />
                    <asp:Parameter Name="產品編號" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="類別編號" Type="Int32" />
                    <asp:Parameter Name="產品編號" Type="String" />
                    <asp:Parameter Name="品名" Type="String" />
                    <asp:Parameter Name="單價" Type="Int32" />
                    <asp:Parameter Name="圖示" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="產品編號" DataSourceID="SqlDataSource_Product" ForeColor="#333333" 
                GridLines="None" Width="95%" PageSize="5" 
                onrowcommand="GridView1_RowCommand">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="更新" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="取消" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="編輯" />
                            <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                CommandArgument='<%# Eval("圖示") %>' CommandName="Delete" Text="刪除" />
                        </ItemTemplate>
                        <ItemStyle Width="90px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="產品編號" HeaderText="產品編號" ReadOnly="True" 
                        SortExpression="產品編號">
                    <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="類別編號" SortExpression="類別編號">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource_ProductClass" DataTextField="類別名稱" 
                                DataValueField="類別編號" SelectedValue='<%# Bind("類別編號") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource_ProductClass" DataTextField="類別名稱" 
                                DataValueField="類別編號" Enabled="False" SelectedValue='<%# Bind("類別編號") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="品名" SortExpression="品名">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("品名") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("品名") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="單價" SortExpression="單價">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("單價") %>' Width="50px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("單價") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="70px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="圖示" SortExpression="圖示">
                        <EditItemTemplate>
                            <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# Eval("圖示", "product_img/{0}") %>' Width="130px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# Eval("圖示", "product_img/{0}") %>' Width="130px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
    </p>
</asp:Content>

