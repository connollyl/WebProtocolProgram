<%@ Page Title="" Language="C#" MasterPageFile="~/Prog6/Prog6MasterPage.master" AutoEventWireup="true" CodeBehind="SetRoles.aspx.cs" Inherits="WebSite.Prog6.Admin.SetRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table style="width: 100%">
        <tr>
            <td colspan="2">
                <asp:TextBox ID="txtbxRole" runat="server" style="margin-left: 69px"></asp:TextBox>
            </td>
            <td style="width: 125px">&nbsp;</td>
            <td colspan="2">
                <asp:DropDownList ID="ddlUsers" runat="server" style="margin-left: 76px" DataSourceID="SDSUsers" DataTextField="Username" DataValueField="Username" Height="16px" Width="131px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 125px">&nbsp;</td>
            <td style="width: 125px">&nbsp;</td>
            <td style="width: 125px">&nbsp;</td>
            <td colspan="2">
                <asp:Button ID="btnDeleteUser" runat="server" style="margin-left: 88px" Text="Delete User" Width="109px" OnClick="btnDeleteUser_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 125px; height: 23px;">
                <asp:Button ID="btnAddRole" runat="server" Text="Add Role" Width="122px" OnClick="btnAddRole_Click" />
            </td>
            <td style="width: 125px; height: 23px;">
                <asp:Button ID="btnRemoveRole" runat="server" Text="Delete Role" Width="123px" OnClick="btnRemoveRole_Click" />
            </td>
            <td style="width: 125px; height: 23px;"></td>
            <td style="width: 141px; height: 23px;">
                <asp:Button ID="btnRoleToUser" runat="server" Text="Add Role to User" Width="139px" OnClick="btnRoleToUser_Click" />
            </td>
            <td style="width: 125px; height: 23px;">
                <asp:Button ID="btnRoleFromUser" runat="server" Text="Remove Role from User" Width="150px" OnClick="btnRoleFromUser_Click" style="margin-left: 1px" />
            </td>
        </tr>
        <tr>
            <td style="width: 125px">&nbsp;</td>
            <td style="width: 125px">&nbsp;</td>
            <td style="width: 125px">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DropDownList ID="ddlRoles" runat="server" style="margin-left: 76px" Width="108px" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
                    <asp:ListItem>...</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Member</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 100px">&nbsp;</td>
            <td colspan="2">
                <asp:DropDownList ID="ddlSUsers" runat="server" style="margin-left: 68px" Height="16px" Width="120px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 125px; height: 22px;"></td>
            <td style="width: 125px; height: 22px;"></td>
            <td style="width: 125px; height: 22px;"></td>
            <td style="width: 141px; height: 22px;"></td>
            <td style="width: 125px; height: 22px;"></td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:TextBox ID="txtbxMessage" runat="server" Height="78px" style="margin-left: 111px" TextMode="MultiLine" Width="415px" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SDSUsers" runat="server" ConnectionString="<%$ ConnectionStrings:UWP3870ConnectionStringServer %>" SelectCommand="SELECT [Username] FROM [Users]" DeleteCommand="delete from Users where Username = @Username">
        <DeleteParameters>
            <asp:ControlParameter ControlID="ddlUsers" Name="Username" PropertyName="SelectedValue" />
        </DeleteParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSAdmin" runat="server" DeleteCommand="delete from Admin where Username = @Username" InsertCommand="insert into Admin(Username) values (@Username)" SelectCommand="SELECT [Username] FROM [Admin]">
        <DeleteParameters>
            <asp:ControlParameter ControlID="ddlUsers" Name="Username" PropertyName="SelectedValue" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="ddlUsers" Name="Username" PropertyName="SelectedValue" />
        </InsertParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDSMember" runat="server" ConnectionString="<%$ ConnectionStrings:UWP3870ConnectionStringServer %>" DeleteCommand="delete from Member where Username = @Username" InsertCommand="insert into Members where Username = @Username" SelectCommand="SELECT [Username] FROM [Member]">
    <DeleteParameters>
        <asp:ControlParameter ControlID="ddlUsers" Name="Username" PropertyName="SelectedValue" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="ddlUsers" Name="Username" PropertyName="SelectedValue" />
    </InsertParameters>
</asp:SqlDataSource>
</asp:Content>
