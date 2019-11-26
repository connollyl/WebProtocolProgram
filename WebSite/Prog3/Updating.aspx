<%@ Page Title="" Language="C#" MasterPageFile="~/Prog3/Prog3Master.Master" AutoEventWireup="true" CodeBehind="Updating.aspx.cs" Inherits="WebSite.Prog3.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 700px;
        }
        .auto-style2 {
            width: 240px;
        }
        .auto-style3 {
            margin-left: 142px;
        }
        .auto-style4 {
            margin-left: 57px;
        }
        .auto-style5 {
            margin-left: 0px;
            margin-right: 120px;
        }
        .auto-style6 {
            width: 240px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="Product ID"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtPID" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPID" ErrorMessage="Product ID is Required" ForeColor="Red" ValidationGroup="New"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" runat="server" Text="Product Name"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="Product Name is Required" ForeColor="Red" ValidationGroup="New"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label3" runat="server" Text="Unit Price"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Unit Price is Required" ForeColor="Red" ControlToValidate="txtPrice" ValidationGroup="New"></asp:RequiredFieldValidator>
                <br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Price must be a non-negative integer" ControlToValidate="txtPrice" ForeColor="Red" MaximumValue="100000000" MinimumValue="0" Type="Double" ValidationGroup="New"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label4" runat="server" Text="Product Description"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnFirst" runat="server" CssClass="auto-style3" Text="First" OnClick="btnFirst_Click" />
            </td>
            <td class="auto-style2">
                <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" />
                <asp:Button ID="btnNext" runat="server" CssClass="auto-style4" Text="Next" OnClick="btnNext_Click" />
            </td>
            <td>
                <asp:Button ID="btnLast" runat="server" CssClass="auto-style5" Text="Last" OnClick="btnLast_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            </td>
            <td class="auto-style2">
                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
            </td>
            <td>
                <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtMessage" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblTest" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
