<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Product_Add.aspx.cs" Inherits="Admin_Product_Add" %>

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
    <p>
        <img class="style5" src="images/add-product.jpg" /><asp:SqlDataSource ID="SqlDataSource_Product" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
            DeleteCommand="DELETE FROM [產品資料] WHERE [產品編號] = @產品編號" 
            InsertCommand="INSERT INTO [產品資料] ([類別編號], [產品編號], [品名], [單價], [圖示]) VALUES (@類別編號, @產品編號, @品名, @單價, @圖示)" 
            SelectCommand="SELECT * FROM [產品資料]" 
            UpdateCommand="UPDATE [產品資料] SET [類別編號] = @類別編號, [品名] = @品名, [單價] = @單價, [圖示] = @圖示 WHERE [產品編號] = @產品編號">
            <DeleteParameters>
                <asp:Parameter Name="產品編號" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="類別編號" Type="Int32" />
                <asp:Parameter Name="品名" Type="String" />
                <asp:Parameter Name="單價" Type="Int32" />
                <asp:Parameter Name="圖示" Type="String" />
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
        <table cellpadding="5" cellspacing="0" class="style1">
            <tr bgcolor="#C2ECEF">
                <td width="100">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" width="100">
                    產品編號</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtProductId" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtProductId" ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    類別名稱</td>
                <td align="left" bgcolor="White">
                    <asp:DropDownList ID="ddl_ProductClass" runat="server" 
            DataSourceID="SqlDataSource_ProductClass" DataTextField="類別名稱" 
            DataValueField="類別編號">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource_ProductClass" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
            SelectCommand="SELECT * FROM [產品類別] ORDER BY [類別編號] DESC">
        </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    品名</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtProductName" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    單價</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtPrice" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    圖示</td>
                <td align="left" bgcolor="White">
                    <asp:FileUpload ID="FileUpload_Img" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="FileUpload_Img" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>

             
            <tr bgcolor="#C2ECEF">
                <td width="100">
                    &nbsp;</td>
                <td align="left" valign="middle">
        <asp:Button ID="btnProductAdd" runat="server" onclick="btnProductAdd_Click" 
            Text="產品新增" />
                </td>
            </tr>
        </table>
    </p>
    <p>
        &nbsp;</p>
    </asp:Content>

