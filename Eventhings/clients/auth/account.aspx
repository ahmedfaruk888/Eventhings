<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="Eventhings.clients.auth.account" %>

<asp:Content ID="headContentContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">

</asp:Content>

<asp:Content ID="pageHeaderContent" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
    <div class="row">
        <div class="alert alert-info alert-dismissible" id="divAlert">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <p id="lblErrorText">

            </p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <section class="contact-form-wrapper">
        <form action="account.aspx" method="POST" id="frmAccount" runat="server">

            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="newqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#newqrcodecontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            New Account
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#mappedqrcodecontent"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            New Roles</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="unmappedqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#unmappedqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Manage User
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="printqrcode-tab" data-mdb-toggle="tab" data-mdb-target="#printqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Manage Role
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="newqrcodecontent" role="tabpanel" aria-labelledby="newqrcode-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p>Manage all account information, user, customer, roles etc</p>
                            </section>

                            <div class="form-group col-md-12">
                                <input type="text" class="form-control col-md-12" id="txtSearch" name="txtSearch" placeholder="Search... by phone or email">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtBatchName">First Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtFirstName" required="required" name="txtFirstName" placeholder="Farouq">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtBatchName">Last Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtLastName" required="required" name="txtLastName" placeholder="Ahmed">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtBatchName">Other Name</label>
                                <input type="text" class="form-control" id="txtOtherName" name="txtOtherName" placeholder="Monkwo">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtCustomerFullName"> Email <sup>*</sup></label>
                                <input type="email" class="form-control" id="txtEmail" required="required" name="txtEmail" placeholder="ahmedfaruk888@gmail.com">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtCustomerFullName"> Phone Number <sup>*</sup></label>
                                <input type="tel" class="form-control" id="txtPhone" required="required" name="txtPhone" placeholder="+2348144488577">
                            </div>

                            <div class="form-group col-md-9">
                                <label for="cmbUserType">User Type <sup>*</sup></label>
                                <select required="required" class="form-control" id="cmbUserType" name="cmbUserType">
                                    
                                </select>
                            </div>

                            <div class="row" id="attendantDiv">
                                <div class="form-group col-md-3">
                                    <label for="txtAddress">Address <sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtAddress" name="txtAddress" placeholder="11 folarin street, lagos">
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="txtDepartment">Department <sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtDepartment" name="txtDepartment" placeholder="Account">
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="txtDesignation">Designation <sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtDesignation" name="txtDesignation" placeholder="Senior Manager">
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="txtDateEmployed">Date Employed <sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtDateEmployed" name="txtDateEmployed" placeholder="1/23/2021">
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="txtDateResumed">Date Resumed <sup>*</sup></label>
                                    <input type="text" class="form-control" id="txtDateResumed" name="txtDateResumed" placeholder="1/23/2021">
                                </div>
                            </div>

                            <div class="form-group col-md-3">
                                <input id="chkEnable" checked="checked" name="chkEnable" type="checkbox" value="" />
                                <label for="chkEnable"> &nbsp; Enable this user by default</label>
                            </div>

                            <div id="walletDiv">
                                <h3>Wallet</h3>
                                <hr />
                                <div class="form-group col-md-3">
                                    <label for="txtCodeCount">Wallet - Top-up Amount <sup>*</sup></label>
                                    <input type="number" min="1" max="50" class="form-control" id="txtTopUpAmount" name="txtTopUpAmount" placeholder="Between 1000 - nth thousand">
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit" id="btnSaveAccount" class="btn btn-lg btn-primary mb-4">Create Customer</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only map a single QR code text to a single user at a time.</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="mappedqrcodecontent" role="tabpanel" aria-labelledby="mappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                           Mapped QR code text are QR code text that has been mapped to any customer, choose default event if for eventi.ng.
                        </p>
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p>Manage all account role information for user, customes retc</p>
                            </section>

                            <div class="form-group col-md-3">
                                <label for="txtRoleName">Role Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtRoleName" name="txtRoleName" placeholder="Customer">
                            </div>

                            <div class="form-group col-md-7">
                                <label for="txtRoleDescription">Description</label>
                                <input type="text" class="form-control" id="txtRoleDescription" name="txtRoleDescription" placeholder="Role description">
                            </div>

                            <div class="form-group col-md-2">
                                <label for="txtRoleLevel">Level<sup>*</sup></label>
                                <input type="number" class="form-control" id="txtRoleLevel" min="1" max="10" name="txtRoleLevel" placeholder="1 - 10">
                            </div>

                            <div class="form-group col-md-6">
                                <input id="chkEnableRole" name="chkEnableRole" checked="checked" required="required" type="checkbox" value="" />
                                <label for="chkEnableRole">Enable this role by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveRole" class="btn btn-lg btn-primary mb-4">Create Role</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only create a single role at a time, for bulk role... request features</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="unmappedqrcodecontent" role="tabpanel" aria-labelledby="unmappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                            All user information
                        </p>
                        <div class="form-group col-md-12">
                            <input type="text" class="form-control col-md-12" id="txtSearch1" name="txtSearch" placeholder="Search... by phone or email">
                        </div>
                        <div style="max-height: 300px; overflow-y:scroll">
                            <table class="table table-striped table-bordered" style="width: 100%; font-size: .7rem;" id="userTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">User Code</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Phone Number</th>
                                    <th scope="col">User Status</th>
                                    <th scope="col">Created Date</th>
                                </tr>
                            </thead>
                            <tbody id="userTBody">
                            </tbody>
                        </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="printqrcodecontent" role="tabpanel" aria-labelledby="printqrcode-tab">
                        <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                            <p>All Role Information</p>
                        </section>
                        <div class="form-group col-md-12">
                                <input type="text" class="form-control col-md-12" id="txtSearch2" name="txtSearch" placeholder="Search... by phone or email">
                            </div>
                        <div style="max-height: 300px; overflow-y:scroll">
                            <table class="table table-striped table-bordered"  style="width:100%; font-size: .7rem;" id="roleTable">
                            <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="mstrRoleChecked" />
                                        </div>
                                    </th>
                                    <th scope="col">S/N</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Level</th>
                                    <th scope="col">Role Status</th>
                                    <th scope="col">Created Date</th>
                                    <th scope="col">Created By</th>
                                </tr>
                            </thead>
                            <tbody id="roleTBody">
                                
                            </tbody>
                        </table>
                        <div>
                    </div>
                </div>
            </div>
                <</div>
            </div>
        </form>
    </section>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">

        function GetRoleTypes() {

            $.ajax({
                type: "POST",
                url: "/Services/roles.asmx/Get",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                /*data: JSON.stringify(data),*/
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#cmbUserType').empty();
                    $('#cmbUserType').append($("<option></option>").val('0').html('-- Please choose user type --'))
                    $.each(responseData, function (i, data) {

                        $('#cmbUserType').append($("<option></option>").val(data.id).html(data.name));

                    });

                    $('#roleTBody').empty();
                    $.each(responseData, function (i, row) {

                        //// convert MVC datetime (e.g. "\/Date(628318530718)\/") into JavaScript Date
                        //var value = new Date(parseInt(value.replace("/Date(", "").replace(")/", ""), 10));
                        let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td>${row.name}</td>
                                            <td>${row.description}</td>
                                            <td>${row.level}</td>
                                            <td>${(row.active == 1) ? "Active" : "Inactive"}</td>
                                            <td>${(row.created_at != undefined) ? $.formattedDate(row.created_at) : " - "}</td>
                                            <td>${(row.created_by == undefined) ? " - " : row.created_by}</td>
                                        </tr>`;

                        $('#roleTBody').append(rows);
                    });
                    //$('#roleTable').DataTable();

                },
                beforeSend: function () {
                    $('#cmbUserType').append($("<option>Loading roles..</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetAllUsers() {

            $.ajax({
                type: "POST",
                url: "/Services/authenticate.asmx/Get",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                //data: JSON.stringify(data),
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    var status = responseData.Status;

                    $('#userTBody').empty();
                    $.each(responseData, function (i, row) {
                        let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td>${row.user_code}</td>
                                            <td>${row.last_name + " " + row.first_name}</td>
                                            <td>${row.email}</td>
                                            <td>${row.phone_number}</td>
                                            <td>${(row.active == 1) ? "Active" : "Inactive"}</td>
                                            <td>${(row.created_at == undefined) ? " - " : $.formattedDate(row.created_at)}</td>
                                        </tr>`;

                        $('#userTBody').append(rows);
                    });
                    //$('#userTable').DataTable();
                },
                beforeSend: function () {
                    $("#btnSaveAccount").attr('disabled', true);
                },
                complete: function () {
                    $("#btnSaveAccount").attr('disabled', false);
                },
                error: function (data) {
                    console.log(data);
                    $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });

        }

        $(document).ready(function () {

            $('#walletDiv').css('display', 'none');
            $('#attendantDiv').css('display', 'none');


            $('#cmbUserType').on('change', function () {
                if ($(this).val() == '1') {
                    $('#walletDiv').css('display', 'inline');
                } else {
                    $('#walletDiv').css('display', 'none');
                }

                if ($(this).val() == '3') {
                    $('#attendantDiv').css('display', 'flex');
                } else {
                    $('#attendantDiv').css('display', 'none');
                }
            });

            //Get all role types
            GetRoleTypes();
            GetAllUsers();

            $('label sup').css('color', 'red');

            //Get all user stored
            //GetAllUsers();

            //Save new account information
            $("#btnSaveAccount").on('click', function (e) {

                e.preventDefault();

                var email= $("#txtEmail").val();
                var phone_number= $("#txtPhone").val();
                var user_type = $("#cmbUserType option:selected").val();
                var first_name= $("#txtFirstName").val();
                var last_name= $("#txtLastName").val();

                if (first_name == '' || first_name.length < 1) {
                    $("#lblErrorText").html("Please fill out the required field(s) - first name is required"); return;
                }
                if (last_name == '' || last_name.length < 1) {
                    $("#lblErrorText").html("Please fill out the required field(s) - last name is required"); return;
                }
                if (email == '' || email.length < 1) {
                    $("#lblErrorText").html("Please fill out the required field(s) - email addres is required"); return;
                }
                if (phone_number == '' || phone_number.length < 1){
                    $("#lblErrorText").html("Please fill out the required field(s) - phone number is required"); return;
                }
                if (user_type == '0' || last_name.length < 1) {
                    $("#lblErrorText").html("Please fill out the required field(s) - choose a valid user type"); return;
                }

                var register = {
                    user_type: $("#cmbUserType option:selected").val(),
                    email: $("#txtEmail").val(),
                    phone_number: $("#txtPhone").val(),
                    password_hash: $("#txtPassword").val(),
                    first_name: $("#txtFirstName").val(),
                    last_name: $("#txtLastName").val(),
                    other_name: $("#txtOtherName").val(),
                    direction: 1,
                    active: ($('#chkEnable').prop('checked') == true) ? 1 : 0,
                    created_by : sessionStorage.getItem('email'),
                };

                var data = {
                    register: register
                };

                $.ajax({
                    type: "POST",
                    url: "/Services/authenticate.asmx/Register",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            sessionStorage.setItem('email', $("#email").val());
                            $("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmAccount').reset();

                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveAccount").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveAccount").attr('disabled', false);
                    },
                    error: function (data) {
                        console.log(data);
                        $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });

            //Save new role information
            $("#btnSaveRole").on('click', function (e) {

                e.preventDefault();

                var email = sessionStorage.getItem('email');
                var name = $("#txtRoleName").val();
                var description = $("#txtRoleDescription").val();
                var level = $("#txtRoleLevel").val();

                if (name == '' || name.length < 1) {
                    $("#lblErrorText").html("Role name is required"); return;
                }

                if (level == '' || level.length < 1) {
                    $("#lblErrorText").html("Role level is required"); return;
                }

                var roledto = {

                    created_by: email,
                    name: name,
                    description: description,
                    level: level,
                    active: ($('#chkEnableRole').prop('checked') == true) ? 1 : 0,
                };

                var data = {
                    roledto: roledto
                };

                $.ajax({
                    type: "POST",
                    url: "/Services/roles.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            $("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmAccount').reset();

                            GetRoleTypes();

                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveAccount").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveAccount").attr('disabled', false);
                    },
                    error: function (data) {
                        console.log(data);
                        $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });
        });
    </script>
</asp:Content>
