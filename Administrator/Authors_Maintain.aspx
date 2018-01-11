<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Authors_Maintain.aspx.cs" Inherits="Authors_Maintain" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource runat="server" ID="sdsSqlDataSourceDropDownListAuthor"
        ConnectionString="<%$ConnectionStrings:CPMS%>"
        SelectCommand="SELECT AuthorID, LastName + ', ' + FirstName + ' ' + MiddleInitial AS Name
                         FROM Author
                        ORDER BY LastName, FirstName, MiddleInitial;">
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="sdsSqlDataSourceFormView"
        ConnectionString="<%$ConnectionStrings:CPMS%>"
        OldValuesParameterFormatString="original_{0}"
        OnInserted="sdsSqlDataSourceFormView_Inserted"
        SelectCommand="SELECT *
                         FROM Author
                        WHERE AuthorID = @AuthorID;"
        InsertCommand="INSERT
                         INTO Author
                            (
                              FirstName,
                              MiddleInitial,
                              LastName,
                              Affiliation,
                              Department,
                              Address,
                              City,
                              State,
                              ZipCode,
                              PhoneNumber,
                              EmailAddress,
                              Password
                            )
                       VALUES
                            (
                              @FirstName,
                              @MiddleInitial,
                              @LastName,
                              @Affiliation,
                              @Department,
                              @Address,
                              @City,
                              @State,
                              @ZipCode,
                              @PhoneNumber,
                              @EmailAddress,
                              @Password
                            ) ;
                       SELECT @AuthorID = SCOPE_IDENTITY();"
        UpdateCommand="UPDATE Author
                          SET FirstName = @FirstName,
                              MiddleInitial = @MiddleInitial,
                              LastName = @LastName,
                              Affiliation = @Affiliation,
                              Department = @Department,
                              Address = @Address,
                              City = @City,
                              State = @State,
                              ZipCode = @ZipCode,
                              PhoneNumber = @PhoneNumber,
                              EmailAddress = @EmailAddress,
                              Password = @Password
                        WHERE AuthorID = @original_AuthorID;"
        DeleteCommand="DELETE
                         FROM Author
                        WHERE AuthorID = @original_AuthorID;">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlAuthor" Name="AuthorID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Direction="Output" Name="AuthorID" type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:Table runat="server" SkinID="skiFrame">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button runat="server" ID="btnMenu" CausesValidation="false" OnClick="btnMenu_Click" Text="Menu" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Author:" SkinID="skiDropDownListLabel"/><br />
                            <asp:DropDownList runat="server" ID="ddlAuthor" AutoPostBack="true" DataSourceID="sdsSqlDataSourceDropDownListAuthor" DataTextField="Name" DataValueField="AuthorID" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:FormView runat="server" ID="forFormView"
                                DataKeyNames="AuthorID"
                                DataSourceID="sdsSqlDataSourceFormView"
                                EmptyDataText="No Data to Display"
                                OnItemInserted="forFormView_ItemInserted"
                                OnItemUpdated="forFormView_ItemUpdated"
                                OnItemDeleted="forFormView_ItemDeleted"
                                OnPreRender="forFormView_PreRender">
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="btnAdd" CausesValidation="false" CommandName="New" Text="Add" />
                                    <asp:Button runat="server" ID="btnModify" CausesValidation="false" CommandName="Edit" Text="Modify" />
                                    <asp:Button runat="server" ID="btnDelete" CausesValidation="false" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item? Click OK to delete it. Click Cancel to keep it.');" /><br />
                                    <asp:Table runat="server" ID="tblAuthor" Enabled="false">
                                        <%--Copy Area Start--%>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Table runat="server">
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="First Name" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtFirstName" MaxLength="50" Text='<%# Bind("FirstName") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage="FirstName is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Middle Initial" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtMiddleInitial" MaxLength="1" Text='<%# Bind("MiddleInitial") %>' Width="20px" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Last Name" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtLastName" MaxLength="50" Text='<%# Bind("LastName") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage="LastName is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Affiliation" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtAffiliation" MaxLength="50" Text='<%# Bind("Affiliation") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAffiliation" ErrorMessage="Affiliation is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Department" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtDepartment" MaxLength="50" Text='<%# Bind("Department") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDepartment" ErrorMessage="Department is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Address" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtAddress" MaxLength="50" Text='<%# Bind("Address") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="City" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtCity" MaxLength="50" Text='<%# Bind("City") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity" ErrorMessage="City is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="State" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <reb:DropDownListState runat="server" ID="ddlState" SelectedValue='<%# Bind("State") %>' />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Zip Code" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtZipCode" MaxLength="10" Text='<%# Bind("ZipCode") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtZipCode" ErrorMessage="ZipCode is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Phone Number" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtPhoneNumber" MaxLength="50" Text='<%# Bind("PhoneNumber") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="PhoneNumber is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Email Address" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtEmailAddress" MaxLength="100" Text='<%# Bind("EmailAddress") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="EmailAddress is a required field." SetFocusOnError="true" />
                                                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="The required format for EmailAddress is xxx@yyy.zzz." SetFocusOnError="true" ValidationExpression="\S+@\S+\.\S+" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Password" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtPassword" MaxLength="5" Text='<%# Bind("Password") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%--Copy Area End--%>
                                    </asp:Table>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Button runat="server" ID="btnAddSave" CausesValidation="true" CommandName="Insert" Text="Save" />
                                    <asp:Button runat="server" ID="btnAddCancel" CausesValidation="false" CommandName="Cancel" Text="Cancel" /><br />
                                    <asp:Table runat="server" ID="tblAuthor" Enabled="true">
                                        <%--Copy Area Start--%>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Table runat="server">
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="First Name" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtFirstName" MaxLength="50" Text='<%# Bind("FirstName") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage="FirstName is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Middle Initial" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtMiddleInitial" MaxLength="1" Text='<%# Bind("MiddleInitial") %>' Width="20px" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Last Name" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtLastName" MaxLength="50" Text='<%# Bind("LastName") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage="LastName is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Affiliation" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtAffiliation" MaxLength="50" Text='<%# Bind("Affiliation") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAffiliation" ErrorMessage="Affiliation is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Department" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtDepartment" MaxLength="50" Text='<%# Bind("Department") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDepartment" ErrorMessage="Department is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Address" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtAddress" MaxLength="50" Text='<%# Bind("Address") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="City" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtCity" MaxLength="50" Text='<%# Bind("City") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity" ErrorMessage="City is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="State" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <reb:DropDownListState runat="server" ID="ddlState" SelectedValue='<%# Bind("State") %>' />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Zip Code" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtZipCode" MaxLength="10" Text='<%# Bind("ZipCode") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtZipCode" ErrorMessage="ZipCode is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Phone Number" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtPhoneNumber" MaxLength="50" Text='<%# Bind("PhoneNumber") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="PhoneNumber is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Email Address" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtEmailAddress" MaxLength="100" Text='<%# Bind("EmailAddress") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="EmailAddress is a required field." SetFocusOnError="true" />
                                                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="The required format for EmailAddress is xxx@yyy.zzz." SetFocusOnError="true" ValidationExpression="\S+@\S+\.\S+" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Password" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtPassword" MaxLength="5" Text='<%# Bind("Password") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%--Copy Area End--%>
                                    </asp:Table>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button runat="server" ID="btnModifySave" CausesValidation="true" CommandName="Update" Text="Save" />
                                    <asp:Button runat="server" ID="btnModifyCancel" CausesValidation="false" CommandName="Cancel" Text="Cancel" /><br />
                                    <asp:Table runat="server" ID="tblAuthor" Enabled="true">
                                        <%--Copy Area Start--%>
                                        <asp:TableRow VerticalAlign="Top">
                                            <asp:TableCell>
                                                <asp:Table runat="server">
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="First Name" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtFirstName" MaxLength="50" Text='<%# Bind("FirstName") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName" ErrorMessage="FirstName is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Middle Initial" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtMiddleInitial" MaxLength="1" Text='<%# Bind("MiddleInitial") %>' Width="20px" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Last Name" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtLastName" MaxLength="50" Text='<%# Bind("LastName") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName" ErrorMessage="LastName is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Affiliation" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtAffiliation" MaxLength="50" Text='<%# Bind("Affiliation") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAffiliation" ErrorMessage="Affiliation is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Department" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtDepartment" MaxLength="50" Text='<%# Bind("Department") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDepartment" ErrorMessage="Department is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Address" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtAddress" MaxLength="50" Text='<%# Bind("Address") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="City" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtCity" MaxLength="50" Text='<%# Bind("City") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCity" ErrorMessage="City is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="State" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <reb:DropDownListState runat="server" ID="ddlState" SelectedValue='<%# Bind("State") %>' />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Zip Code" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtZipCode" MaxLength="10" Text='<%# Bind("ZipCode") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtZipCode" ErrorMessage="ZipCode is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Phone Number" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtPhoneNumber" MaxLength="50" Text='<%# Bind("PhoneNumber") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="PhoneNumber is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Email Address" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtEmailAddress" MaxLength="100" Text='<%# Bind("EmailAddress") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="EmailAddress is a required field." SetFocusOnError="true" />
                                                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="The required format for EmailAddress is xxx@yyy.zzz." SetFocusOnError="true" ValidationExpression="\S+@\S+\.\S+" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell SkinID="skiDataLabel">
                                                            <asp:Label runat="server" Text="Password" />
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:TextBox runat="server" ID="txtPassword" MaxLength="5" Text='<%# Bind("Password") %>' />
                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is a required field." SetFocusOnError="true" />
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <%--Copy Area End--%>
                                    </asp:Table>
                                </EditItemTemplate>
                            </asp:FormView>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:ValidationSummary runat="server" />

</asp:Content>
