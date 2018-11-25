<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Base/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row mt-5">
        <div class="col-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    Vehicle 
                </div>
                <div class="panel-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-9">
                                    <div class="row">
                                        <%--    <asp:RegularExpressionValidator ID="revRegCheck" runat="server" ErrorMessage="Please enter a valid reg, or tick cherished plate for custom reg" ControlToValidate="txtReg"
                                            ValidationExpression="^[A-Za-z]{2}[\040]?[0-9]{2}[\040]?[A-Za-z]{3}"></asp:RegularExpressionValidator>--%>
                                    </div>
                                    <label for="txtReg">Registration</label>
                                    <div class="input-group mb-3">
                                        <asp:TextBox runat="server" ID="txtReg" CssClass="form-control"></asp:TextBox>

                                        <div class="input-group-append">
                                            <asp:Button runat="server" ID="btnSubmitReg" CssClass="btn btn-success" Text="Submit" OnClick="btnSubmitReg_Click" />
                                        </div>
                                    </div>
                                    <%--   <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="chkCherishedPlate">
                                        <label class="custom-control-label" for="chkCherishedPlate">Cherished Plate</label>
                                    </div>--%>
                                </div>

                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-6">
                                    <label for="txtMake">Make:</label>
                                    <asp:TextBox runat="server" ID="txtMake" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <label for="txtModel">Model:</label>
                                    <asp:TextBox runat="server" ID="txtModel" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <label for="txtColour">Colour:</label>
                                    <asp:TextBox runat="server" ID="txtColour" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <label for="txtMileageatlastMOT">Mileage at last MOT:</label>
                                    <asp:TextBox runat="server" ID="txtMileageatlastMOT" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <label for="txtMOTExpiryDate">MOT Expiry Date:</label>
                                    <asp:TextBox runat="server" ID="txtMOTExpiryDate" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <label for="txtDaysRemaining">Days remaining:</label>
                                    <asp:TextBox runat="server" ID="txtDaysRemaining" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <asp:PlaceHolder runat="server" ID="plcTests" Visible="false">
    <div class="panel panel-primary">
        <div class="panel-heading">
            MOT 
        </div>
        <div class="panel-body">
            <ul class="list-group list-group-flush">
                <asp:Repeater runat="server" ID="rptMOT" OnItemDataBound="rptMOT_ItemDataBound">
                    <ItemTemplate>
                        <li class="list-group-item">
                             <div class="row">
                                <div class="col-3">
                                    <label for="txtCompletedDate">Completed Date:</label>
                                    <asp:TextBox runat="server" ID="txtCompletedDate" ReadOnly="true" CssClass="form-control" Text='<%# Eval("completedDate") %>'></asp:TextBox>
                                </div>
                                 <div class="col-3">
                                    <label for="txtTestResult">Test Result:</label>
                                    <asp:TextBox runat="server" ID="txtTestResult" ReadOnly="true" CssClass="form-control" Text='<%# Eval("testResult") %>'></asp:TextBox>
                                </div>
                                   <div class="col-3">
                                    <label for="txtExpiryDate">Expiry Date:</label>
                                    <asp:TextBox runat="server" ID="txtExpiryDate" ReadOnly="true" CssClass="form-control"  Text='<%# Eval("expiryDate") %>'></asp:TextBox>
                                </div>
                                 <div class="col-3">
                                    <label for="txtOdometerValue">Odometer Value:</label>
                                    <asp:TextBox runat="server" ID="txtOdometerValue" ReadOnly="true" CssClass="form-control"  Text='<%# Eval("odometerValue") %>'></asp:TextBox>
                                </div>
                                 <br />
                                  <div class="col-12">
                                    <label for="lblCommentText">Comment:</label>
                                    <asp:label runat="server" ID="lblCommentText" ReadOnly="true"></asp:label>
                                </div>
                              </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
              
            </ul>
        </div>
    </div>    
    </asp:PlaceHolder>
    <script type="text/javascript">
 <%--     $("#chkCherishedPlate").change(function () {
            var validator;
            validator = $('#<%=revRegCheck.ClientID %>');
          var check = !$("#chkCherishedPlate")[0].checked;
          console.log(check);
           // validator.isvalid = true;
           //ValidatorEnable(validator[0],$("#chkCherishedPlate")[0].checked);
            ValidatorEnabled(validator, check);
        });--%>

</script>
</asp:Content>

