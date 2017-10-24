<%@ Page Title="" Language="C#" MasterPageFile="~/�e�x.master" AutoEventWireup="true" CodeFile="Member_Add.aspx.cs" Inherits="Member_Add" %>

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
        .style8
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <img class="style5" src="images/add-member.jpg" /><asp:SqlDataSource 
            ID="SqlDataSource_Member" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringMyDB %>" 
            SelectCommand="SELECT * FROM [�|��]" 
            DeleteCommand="DELETE FROM [�|��] WHERE [�b��] = @�b��" 
            InsertCommand="INSERT INTO [�|��] ([�b��], [�K�X], [�K�X����], [�m�W], [�H�c], [�q��], [��}]) VALUES (@�b��, @�K�X, @�K�X����, @�m�W, @�H�c, @�q��, @��})" 
            UpdateCommand="UPDATE [�|��] SET [�K�X] = @�K�X, [�K�X����] = @�K�X����, [�m�W] = @�m�W, [�H�c] = @�H�c, [�q��] = @�q��, [��}] = @��} WHERE [�b��] = @�b��">
            <DeleteParameters>
                <asp:Parameter Name="�b��" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="�b��" Type="String" />
                <asp:Parameter Name="�K�X" Type="String" />
                <asp:Parameter Name="�K�X����" Type="String" />
                <asp:Parameter Name="�m�W" Type="String" />
                <asp:Parameter Name="�H�c" Type="String" />
                <asp:Parameter Name="�q��" Type="String" />
                <asp:Parameter Name="��}" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="�K�X" Type="String" />
                <asp:Parameter Name="�K�X����" Type="String" />
                <asp:Parameter Name="�m�W" Type="String" />
                <asp:Parameter Name="�H�c" Type="String" />
                <asp:Parameter Name="�q��" Type="String" />
                <asp:Parameter Name="��}" Type="String" />
                <asp:Parameter Name="�b��" Type="String" />
            </UpdateParameters>
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
                    �b��</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtUid" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUid" ErrorMessage="*"></asp:RequiredFieldValidator>
                        
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtUid"
                     runat="server" 
                        ErrorMessage="�u���J�Ʀr�έ^��" ValidationExpression="^[A-Za-z0-9]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    �K�X</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPwd" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100" class="style8">
                    �K�X����</td>
                <td align="left" bgcolor="White" class="style8">
                    <asp:TextBox ID="txtPwdforget" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtPwdforget" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    �m�W</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    �H�c</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtMail" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtMail" ErrorMessage="�п�J���T�H�c" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    �q��</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtTel" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" width="100">
                    ��}</td>
                <td align="left" bgcolor="White">
                    <asp:TextBox ID="txtAdd" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtAdd" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
             
            <tr bgcolor="#C2ECEF">
                <td width="100">
                    &nbsp;</td>
                <td align="left" valign="middle">
                    <asp:Button ID="btnMemberAdd" runat="server" onclick="btnMemberAdd_Click" 
                        Text="�|�����U" />
                </td>
            </tr>
        </table>
    </p>
    <p>
        <br />
    </p>
</asp:Content>

