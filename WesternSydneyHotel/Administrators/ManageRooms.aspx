<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRooms.aspx.cs" Inherits="WesternSydneyHotel.Account.Administrators.ManageRooms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="roomData" runat="server" ConnectionString="<%$ ConnectionStrings:customerConnectionString %>"
         SelectCommand="SELECT * FROM [rooms]"
        UpdateCommand="UPDATE [rooms] SET [level] = @level, [beds] = @beds, [orientation] = @orientation, [price] = @price WHERE [rid] = @rid" 
        DeleteCommand="DELETE FROM [rooms] WHERE [rid] = @rid" 
        InsertCommand="INSERT INTO [rooms] ([rid], [level], [beds], [orientation], [price]) VALUES (@rid, @level, @beds, @orientation, @price)">
        <DeleteParameters>
            <asp:Parameter Name="rid" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="rid" Type="String" />
            <asp:Parameter Name="level" Type="String" />
            <asp:Parameter Name="beds" Type="Byte" />
            <asp:Parameter Name="orientation" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="level" Type="String" />
            <asp:Parameter Name="beds" Type="Byte" />
            <asp:Parameter Name="orientation" Type="String" />
            <asp:Parameter Name="price" Type="Double" />
            <asp:Parameter Name="rid" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
    <div class="container">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary" runat="server" ValidationGroup="EditGroup" CssClass="text-danger" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="InsertGroup" CssClass="text-danger" />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="roomData" DataKeyNames="rid" InsertItemPosition="LastItem">
                <LayoutTemplate>                    
                    <table runat="server" class="center-block">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">                                
                                        <th runat="server">Room ID</th>
                                        <th runat="server">Level</th>
                                        <th runat="server">Number of beds</th>
                                        <th runat="server">Room Orientation</th>
                                        <th runat="server">Price</th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                        </tr>
                    </table>                        
                </LayoutTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>There is no record of any rooms :(.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr><td> Insert new room</td></tr>
                    <tr style="">                
                        <td>
                            <asp:TextBox ID="InsertRid" runat="server" Text='<%# Bind("rid") %>' />
                            <asp:RequiredFieldValidator ID="InsertRidRequired" ControlToValidate="InsertRid" runat="server" ValidationGroup="InsertGroup" ErrorMessage="Must enter room ID" Display="None"></asp:RequiredFieldValidator>                            
                        </td>
                        <td>                           
                            <asp:DropDownList ID="InsertLevel" runat="server" SelectedValue='<%# Bind("level") %>'>
                                <asp:ListItem Selected="True" Value="0">Select a Level</asp:ListItem>
                                <asp:ListItem>G</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="InsertLevelRequired" ControlToValidate="InsertLevel" runat="server" ValidationGroup="InsertGroup" ErrorMessage="Please select room level" Display="None"></asp:RequiredFieldValidator>

                        </td>
                        <td>                            
                            <asp:DropDownList ID="InsertBeds" runat="server" SelectedValue='<%# Bind("beds") %>'>
                                <asp:ListItem Selected="True" Value="0">Select Beds</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="InsertBedsRequired" ControlToValidate="InsertBeds" runat="server" InitialValue="0" ValidationGroup="InsertGroup" ErrorMessage="Select number of beds" Display="None"></asp:RequiredFieldValidator>

                        </td>
                        <td>                            
                            <asp:DropDownList ID="InsertOrientation" runat="server" SelectedValue='<%# Bind("orientation") %>'>
                                <asp:ListItem Value="0" Selected="True">Select Orientation</asp:ListItem>
                                <asp:ListItem>N</asp:ListItem>
                                <asp:ListItem>S</asp:ListItem>
                                <asp:ListItem>E</asp:ListItem>
                                <asp:ListItem>W</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="InsertOrientationRequired" ControlToValidate="InsertOrientation" InitialValue="0" ValidationGroup="InsertGroup" runat="server" ErrorMessage="Select the orientation" Display="None"></asp:RequiredFieldValidator>

                        </td>
                        <td>
                            <asp:TextBox ID="InsertPrice" runat="server" Text='<%# Bind("price") %>' />

                            <asp:RequiredFieldValidator ID="InsertPriceRequired" ControlToValidate="InsertPrice" runat="server" ValidationGroup="InsertGroup" ErrorMessage="Enter the room cost" Display="None" ></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="InsertPriceRangeValidator" ControlToValidate="InsertPrice" Display="None" ValidationGroup="InsertGroup" MinimumValue="10.00" MaximumValue="1000.00" Type="Double" runat="server" ErrorMessage="RangeValidator"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" ValidationGroup="InsertGroup" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    
                    <tr style="background-color:#DCDCDC;color: #000000;">
                
                        <td>
                            <asp:Label runat="server" ID="ridLabel" Text='<%# Eval("rid") %>'></asp:Label>

                        </td>
                        <td>
                            <asp:Label runat="server" ID="levelLabel" Text='<%# Eval("level") %>'></asp:Label>

                        </td>
                        <td>
                            <asp:Label runat="server" ID="bedsLabel" Text='<%# Eval("beds") %>'></asp:Label>

                        </td>
                        <td>
                            <asp:Label runat="server" ID="orientationLabel" Text='<%# Eval("orientation") %>'></asp:Label>

                        </td>
                        <td>
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />

                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                
                        <td>
                            <asp:Label ID="ridLabel" runat="server" Text='<%# Eval("rid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="levelLabel" runat="server" Text='<%# Eval("level") %>' />
                        </td>
                        <td>
                            <asp:Label ID="bedsLabel" runat="server" Text='<%# Eval("beds") %>' />
                        </td>
                        <td>
                            <asp:Label ID="orientationLabel" runat="server" Text='<%# Eval("orientation") %>' />
                        </td>
                        <td>
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">                
                        <td>
                            <asp:Label ID="ridLabel1" runat="server" Text='<%# Eval("rid") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="EditLevel" runat="server" SelectedValue='<%# Bind("level") %>'>
                                <asp:ListItem>G</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                            </asp:DropDownList>                            
                        </td>
                        <td>                            
                            <asp:DropDownList ID="EditBeds" runat="server" SelectedValue='<%# Bind("beds") %>'>                                
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                            </asp:DropDownList>                            
                        </td>
                        <td>                            
                            <asp:DropDownList ID="EditOrientation" runat="server" SelectedValue='<%# Bind("orientation") %>'>                                
                                <asp:ListItem>N</asp:ListItem>
                                <asp:ListItem>S</asp:ListItem>
                                <asp:ListItem>E</asp:ListItem>
                                <asp:ListItem>W</asp:ListItem>
                            </asp:DropDownList>                            
                        </td>
                        <td>
                            <asp:TextBox ID="EditPrice" runat="server" Text='<%# Bind("price") %>' />
                            <asp:RequiredFieldValidator ID="PriceRequired" runat="server" ErrorMessage="Please enter a price" ValidationGroup="EditGroup" ControlToValidate="EditPrice" Display="None"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="EditPriceRangeValidator" runat="server" ErrorMessage="Price must be between 10.00 and 1000.00" ValidationGroup="EditGroup" ControlToValidate="EditPrice" MinimumValue="10.00" MaximumValue="1000.00" Type="Double" Display="None"></asp:RangeValidator>
                        </td>
                        <td >
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="EditGroup" CausesValidation="true" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                        </td>
                    </tr>
                </EditItemTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="ridLabel" runat="server" Text='<%# Eval("rid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="levelLabel" runat="server" Text='<%# Eval("level") %>' />
                        </td>
                        <td>
                            <asp:Label ID="bedsLabel" runat="server" Text='<%# Eval("beds") %>' />
                        </td>
                        <td>
                            <asp:Label ID="orientationLabel" runat="server" Text='<%# Eval("orientation") %>' />
                        </td>
                        <td>
                            <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>
