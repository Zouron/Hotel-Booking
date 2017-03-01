<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WesternSydneyHotel.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
       <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="gName" CssClass="col-md-2 control-label">Given Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="gName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="gName"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The given name field is required." />
               
                 <asp:RegularExpressionValidator ID="regGName" 
                    runat="server"
                    ControlToValidate="gName" 
                    ErrorMessage="Letters between 1-20"
                    ValidationExpression="^[a-zA-Z,-]{1,20}$"
                    >
                </asp:RegularExpressionValidator>
            </div>
        </div>

           <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="sName" CssClass="col-md-2 control-label">Family Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="sName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="sName"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The family name field is required." />
               
                 <asp:RegularExpressionValidator ID="regSName" 
                    runat="server"
                    ControlToValidate="sName" 
                    ErrorMessage="Letters between 1-20"
                    ValidationExpression="^[a-zA-Z,-]{1,20}$"
                    >
                </asp:RegularExpressionValidator>
            </div>
        </div>

           <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="address" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="address" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="address"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The address field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="suburb" CssClass="col-md-2 control-label">Suburb</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="suburb" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="suburb"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The suburb field is required." />
            </div>
        </div>

           <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="state" CssClass="col-md-2 control-label">State</asp:Label>
            <div class="col-md-05">
                <asp:DropDownList ID="state" runat="server">
                    <asp:ListItem Selected="True" Value="WA"> WA </asp:ListItem>
                  <asp:ListItem Value="NT"> NT </asp:ListItem>
                  <asp:ListItem Value="SA"> SA </asp:ListItem>
                  <asp:ListItem Value="QLD"> QLD </asp:ListItem>
                  <asp:ListItem Value="NSW"> NSW </asp:ListItem>
                  <asp:ListItem Value="VIC"> VIC </asp:ListItem>
                  <asp:ListItem Value="TAS"> TAS </asp:ListItem>
                  <asp:ListItem Value="ACT"> ACT </asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="state"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The state field is required." />
            </div>
        </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="postCode" CssClass="col-md-2 control-label">Post Code</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="postCode" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="postCode"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The post code field is required." />

                <asp:RegularExpressionValidator ID="regPostCode" 
                    runat="server"
                    ControlToValidate="postCode" 
                    ErrorMessage="Only 4 digits"
                    ValidationExpression="^\d{4}$"
                    >
                </asp:RegularExpressionValidator>
            </div>
        </div>

           <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="mobileP" CssClass="col-md-2 control-label">Mobile Phone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="mobileP" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="mobileP"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The address field is required." />

                <asp:RegularExpressionValidator ID="regMobileP" 
                    runat="server"
                    ControlToValidate="mobileP" 
                    ErrorMessage="start with 04 and 8 digits after"
                    ValidationExpression="^[04]{2}(\d{8})$"
                    >
                </asp:RegularExpressionValidator>

            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                  <asp:Label
                  id="lblResult"
                  Runat="server" />
            </div>
        </div>

    </div>
</asp:Content>
