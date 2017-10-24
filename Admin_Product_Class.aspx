<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Product_Class.aspx.cs" Inherits="Admin_Product_Class" %>

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
        <img class="style5" src="images/class-product-manager.jpg" /><asp:ScriptManager 
            ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
</p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p>
                <asp:SqlDataSource ID="SqlDataSource_ProductClass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
        DeleteCommand="DELETE FROM [產品類別] WHERE [類別編號] = @類別編號" 
        InsertCommand="INSERT INTO [產品類別] ([類別名稱]) VALUES (@類別名稱)" 
        SelectCommand="SELECT * FROM [產品類別] ORDER BY [類別編號] DESC" 
        UpdateCommand="UPDATE [產品類別] SET [類別名稱] = @類別名稱 WHERE [類別編號] = @類別編號">
                    <DeleteParameters>
                        <asp:Parameter Name="類別編號" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="類別名稱" Type="String" />
                        <asp:Parameter Name="類別編號" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="類別名稱" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:FormView ID="FormView_ProductClass" runat="server" DataKeyNames="類別編號" 
        DataSourceID="SqlDataSource_ProductClass" DefaultMode="Insert">
                    <EditItemTemplate>
                        類別編號:
                        <asp:Label ID="類別編號Label1" runat="server" Text='<%# Eval("類別編號") %>' />
                        <br />
                        類別名稱:
                        <asp:TextBox ID="類別名稱TextBox" runat="server" Text='<%# Bind("類別名稱") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        類別名稱:
                        <asp:TextBox ID="類別名稱TextBox0" runat="server" Text='<%# Bind("類別名稱") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        類別編號:
                        <asp:Label ID="類別編號Label" runat="server" Text='<%# Eval("類別編號") %>' />
                        <br />
                        類別名稱:
                        <asp:Label ID="類別名稱Label" runat="server" Text='<%# Bind("類別名稱") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="刪除" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="新增" />
                    </ItemTemplate>
                </asp:FormView>
            </p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="類別編號" DataSourceID="SqlDataSource_ProductClass" 
        ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                ShowEditButton="True" >
                        </asp:CommandField>
                        <asp:BoundField DataField="類別編號" HeaderText="類別編號" InsertVisible="False" 
                ReadOnly="True" SortExpression="類別編號" >
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="類別名稱" HeaderText="類別名稱" SortExpression="類別名稱" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
            </p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
    <br />
</p>
</asp:Content>

