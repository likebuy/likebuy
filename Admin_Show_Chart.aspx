<%@ Page Title="產品類別銷售網計圖" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Show_Chart.aspx.cs" Inherits="Admin_Show_Chart" %><%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
        <img class="style5" src="images/sell-product-chart.jpg" /></p>
<p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" SelectCommand="SELECT TOP 5 產品資料.品名, SUM(訂單明細.數量) AS 銷售總額 FROM 訂單明細 INNER JOIN 產品資料 ON 訂單明細.產品編號 = 產品資料.產品編號
GROUP BY 產品資料.品名
ORDER BY 銷售總額 DESC"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" 
        GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
            <asp:BoundField DataField="銷售總額" HeaderText="銷售總額" ReadOnly="True" 
                SortExpression="銷售總額" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</p>
<p>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" 
        Height="400px" Width="450px">
        <series>
            <asp:Series Name="Series1" XValueMember="品名" YValueMembers="銷售總額">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
                <AxisX IsLabelAutoFit="False">
                    <LabelStyle Font="Microsoft Sans Serif, 10pt" />
                </AxisX>
                <Area3DStyle Enable3D="True" />
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
</p>
</asp:Content>

