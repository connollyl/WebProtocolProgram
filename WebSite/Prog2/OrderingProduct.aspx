<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderingProduct.aspx.cs" Inherits="WebSite.Prog2.OrderingProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CS3870- Fall 2019 - Program 2</title>
    <link href="../Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style5 {
            margin-left: 129px;
        }
        .auto-style6 {
            margin-left: 118px;
        }
        .auto-style7 {
            margin-left: 94px;
        }
        .auto-style8 {
            margin-left: 115px;
        }
        .auto-style9 {
            margin-left: 153px;
        }
        .auto-style10 {
            margin-left: 103px;
        }
        .auto-style12 {
            margin-left: 71px;
        }
        .auto-style13 {
            height: 77px;
        }
        .auto-style14 {
            height: 88px;
        }
        .auto-style15 {
            height: 71px;
        }
        .auto-style19 {
            height: 37px;
        }
        .auto-style20 {
            height: 41px;
        }
        .auto-style21 {
            height: 30px;
        }
        .auto-style22 {
            margin-left: 125px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Web Protocols, Technologies and Applications</h1>
            <h2>Logan Connolly</h2>
        </div>
        <div class="navbar">

            <asp:HyperLink ID="StartHL" runat="server" NavigateUrl="~/Prog2/Default.aspx">Start Page</asp:HyperLink>
            <br />
            <asp:HyperLink ID="OrderHL" runat="server" NavigateUrl="~/Prog2/OrderingProduct.aspx">Order Form</asp:HyperLink>
        </div>
        <div>

            <table class="auto-style1" style="margin-left: 30%">
                <tr>
                    <td class="auto-style13">
                        <asp:Label ID="Label1" runat="server" Text="Item ID"></asp:Label>
                        <asp:TextBox ID="txtID" runat="server" AutoPostBack="True" CssClass="auto-style5"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="ID is Required" ControlToValidate="txtID" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtID" ErrorMessage="Id is empty" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9]*$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="Label2" runat="server" Text="Item Price"></asp:Label>
                        <asp:TextBox ID="txtPrice" runat="server" AutoPostBack="True" CssClass="auto-style8" style="text-align: right" TextMode="Number"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Price is Required" ForeColor="Red" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Price must not be empty or is invalid" ForeColor="Red" ControlToValidate="txtPrice" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(\.[0-9][0-9])?$"></asp:RegularExpressionValidator>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Unit Price must be a Positive Number" ForeColor="Red" ControlToValidate="txtPrice" MinimumValue="0" MaximumValue="10000000000000000" Type="Double"></asp:RangeValidator>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        <asp:Label ID="Label3" runat="server" Text="Item Quantity"></asp:Label>
                        <asp:TextBox ID="txtQuantity" runat="server" AutoPostBack="True" CssClass="auto-style7" style="text-align: right" TextMode="Number"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Quantity is Required" ForeColor="Red" ControlToValidate="txtQuantity"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity can not be empty or is invalid" ForeColor="Red" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Quantity must be a Positive integer" ForeColor="Red" ControlToValidate="txtQuantity" MinimumValue="0" MaximumValue="100000000000000000" Type="Double"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        <asp:Label ID="Label4" runat="server" Text="Sub Total"></asp:Label>
                        <asp:TextBox ID="txtSubtotal" runat="server" AutoPostBack="True" CssClass="auto-style6" ReadOnly="True" style="text-align: right"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style20">
                        <asp:Label ID="Label5" runat="server" Text="Tax"></asp:Label>
                        <asp:TextBox ID="txtTax" runat="server" AutoPostBack="True" CssClass="auto-style9" ReadOnly="True" style="text-align: right"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style20">
                        <asp:Label ID="Label6" runat="server" Text="Grand Total"></asp:Label>
                        <asp:TextBox ID="txtGrandtotal" runat="server" AutoPostBack="True" CssClass="auto-style10" ReadOnly="True" style="text-align: right"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">
                        <asp:Button ID="btnCompute" runat="server" CssClass="auto-style22" Text="Calculate" OnClick="btnCompute_Click" />
                        <asp:Button ID="btnReset" runat="server" CssClass="auto-style12" Text="Reset" OnClick="btnReset_Click"  />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
