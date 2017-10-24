﻿<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Update.aspx.cs" Inherits="Admin_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .style1
        {
            
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
    <img class="style5" src="images/admin-password-update.jpg" /><asp:SqlDataSource 
    ID="SqlDataSource_Admin" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
        SelectCommand="SELECT * FROM [管理者] WHERE ([帳號] = @帳號)" 
        UpdateCommand="UPDATE [管理者] SET [密碼] = @密碼 WHERE [帳號] = @帳號" 
        onupdated="SqlDataSource_Admin_Updated">
        <SelectParameters>
            <asp:SessionParameter Name="帳號" SessionField="AdminUid" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="密碼" Type="String" />
            <asp:Parameter Name="帳號" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="帳號" 
    DataSourceID="SqlDataSource_Admin" DefaultMode="Edit">
        <EditItemTemplate>
            <table cellpadding="5" cellspacing="0" class="style1" width="350">
                <tr bgcolor="#C2ECEF">
                    <td width="60">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" width="60">
                        帳號</td>
                    <td align="left" bgcolor="White">
                        <asp:Label ID="帳號Label1" runat="server" Text='<%# Eval("帳號") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="right" width="60">
                        密碼</td>
                    <td align="left" bgcolor="White">
                        <asp:TextBox ID="密碼TextBox" runat="server" Text='<%# Bind("密碼") %>' 
                            TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="密碼TextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr bgcolor="#C2ECEF">
                    <td width="60">
                        &nbsp;</td>
                    <td align="left" valign="middle">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="更新" />
                        　<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </td>
                </tr>
            </table>
            &nbsp;
        </EditItemTemplate>
        <InsertItemTemplate>
            帳號:
            <asp:TextBox ID="帳號TextBox" runat="server" Text='<%# Bind("帳號") %>' />
            <br />
            密碼:
            <asp:TextBox ID="密碼TextBox" runat="server" Text='<%# Bind("密碼") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            帳號:
            <asp:Label ID="帳號Label" runat="server" Text='<%# Eval("帳號") %>' />
            <br />
            密碼:
            <asp:Label ID="密碼Label" runat="server" Text='<%# Bind("密碼") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯" />
        </ItemTemplate>
    </asp:FormView>
    <br />
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    </asp:Content>

