<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="WebSite.CreateUser" %>
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
                        <asp:RequiredFieldValidator ID="RFVUsername" runat="server" ErrorMessage="Username is Required" ControlToValidate="txtbxUsername" ForeColor="Red"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ErrorMessage="Password is Required" ControlToValidate="txtbxPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtbxEmail" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ErrorMessage="Email is Required" ControlToValidate="txtbxEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="REVEmail" runat="server" ErrorMessage="Not in Email Format" ControlToValidate="txtbxEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:SqlDataSource ID="SDSServer" runat="server" ConnectionString="<%$ ConnectionStrings:UWP3870ConnectionStringServer %>" InsertCommand="insert into Users (Username, Password, Email) values (@username, @password, @email)" SelectCommand="SELECT * FROM [Users] where Username=' +txtbxUsername.Text+ '">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtbxUsername" Name="username" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtbxPassword" Name="password" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtbxEmail" Name="email" PropertyName="Text" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Button ID="btnCreate" runat="server" Text="Create User" OnClick="btnCreate_Click" />
                    </td>
                    <td>
                        <asp:HyperLink ID="HLLogin" runat="server" NavigateUrl="~/Login.aspx">Already a User? Log in</asp:HyperLink>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</asp:Content>
