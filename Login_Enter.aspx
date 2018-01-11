<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login_Enter.aspx.cs" Inherits="Login_Enter" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Table runat="server" SkinID="skiFrame">
        <asp:TableRow>
            <asp:TableCell VerticalAlign="Top">
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell SkinID="skiDataLabel">
                            <asp:Label runat="server" Text="Login Type" Width="90px"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButton runat="server" ID="radAdministrator" AutoPostBack="true" Checked="true" GroupName="LoginType" Text="Administrator" /><br />
                            <asp:RadioButton runat="server" ID="radReviewer" AutoPostBack="true" GroupName="LoginType" Text="Reviewer" /><br />
                            <asp:RadioButton runat="server" ID="radAuthor" AutoPostBack="true" GroupName="LoginType" Text="Author" /><br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell SkinID="skiDataLabel">
                            <asp:Label runat="server" Text="Email Address" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtEmailAddress" MaxLength="100" Width="240px" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="EmailAddress is a required field." SetFocusOnError="true" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="The required format for EmailAddress is xxx@yyy.zzz." SetFocusOnError="true" ValidationExpression="\S+@\S+\.\S+" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell SkinID="skiDataLabel">
                            <asp:Label runat="server" Text="Password" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtPassword" MaxLength="5" TextMode="Password" Width="240px" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell VerticalAlign="Top">
                            <asp:Button runat="server" ID="btnLogin" CausesValidation="true" EnableTheming="false" OnClick="btnLogin_Click" Text="Login" Width="93px" />
                        </asp:TableCell>
                        <asp:TableCell VerticalAlign="Top">
                            <asp:Button runat="server" ID="btnSendPassword" CausesValidation="true" EnableTheming="false" Text="Send Password" Width="120px" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <asp:LinkButton runat="server" ID="btnRegisterAsReviewer" CausesValidation="false" PostBackUrl="~/Reviewer/Reviewers_Register.aspx" Text="Register for the very first time as a REVIEWER" /><br />
                            <asp:LinkButton runat="server" ID="btnRegisterAsAuthor" CausesValidation="false" PostBackUrl="~/Author/Authors_Register.aspx" Text="Register for the very first time as an AUTHOR" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:ValidationSummary runat="server" />

</asp:Content>
