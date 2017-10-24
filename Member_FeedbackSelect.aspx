<%@ Page Title="客服回報查詢" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Member_FeedbackSelect.aspx.cs" Inherits="Member_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            width: 80%;
            height: 128px;
        }
        .style10
        {
            width: 628px;
            height: 78px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img class="style10" src="images/member-feedbackselect.jpg" /><br />
    </p>
    <p>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource_feedback" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
                SelectCommand="SELECT * FROM [發問] 會員 WHERE ([帳號] = @帳號) ORDER BY 發問編號 DESC  
">
                <SelectParameters>
                    <asp:SessionParameter Name="帳號" SessionField="MemberUid" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="發問編號" DataSourceID="SqlDataSource_feedback" ForeColor="#333333" 
                GridLines="None" Width="539px" 
                onselectedindexchanged="GridView1_SelectedIndexChanged1" PageSize="5">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="發問標題" HeaderText="發問標題" SortExpression="發問標題" />
                    <asp:TemplateField HeaderText="發問內容" SortExpression="發問內容">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("發問內容") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="txtQ" runat="server" Text='<%# Bind("發問內容") %>' Height="100px" 
                                Width="200px" ReadOnly="True"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="發問日期" HeaderText="發問日期" SortExpression="發問日期" />
                    <asp:TemplateField HeaderText="回覆內容" SortExpression="回覆內容">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("回覆內容") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="txtR" runat="server" Text='<%# Bind("回覆內容") %>' Height="100px" 
                                Width="200px" ReadOnly="True"></asp:TextBox>
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
            <br />
            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

