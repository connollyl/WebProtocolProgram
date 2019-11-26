<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebSite.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
        <div style="display: inline-block">

            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtbxUsername" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RFVUsername" runat="server" ControlToValidate="txtbxUsername" ErrorMessage="Username is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblUsername" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtbxPassword" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="txtbxPassword" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="lblPassword" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:SqlDataSource ID="SDSServer" runat="server" ConnectionString="<%$ ConnectionStrings:UWP3870ConnectionStringServer %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </td>
                    <td>
                        <asp:HyperLink ID="createHL" runat="server" NavigateUrl="~/CreateUser.aspx">Create an account</asp:HyperLink>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</asp:Content>
